unit Presentation.Forms.Job;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, htmlcomp, htMarkdownPanel, TextEditor,
  TextEditor.SpellCheck, Domain.Job, htmldraw;

type
  TJobForm = class(TForm)
    htJobDetails: THtPanel;
    Splitter1: TSplitter;
    pnlApply: TPanel;
    btnSave: TButton;
    HtLabel1: THtLabel;
    txtNotes: TTextEditor;
    cbxApplied: TCheckBox;
    procedure btnSaveClick(Sender: TObject);
    procedure htJobDetailsUrlClick(Sender: TElement);
  private
    fId: integer;
    fJob: IJob;
    fRepository: IJobRepository;

    procedure Initialize(const aId: integer);
  public
    class procedure Execute(const aId: integer);
  end;

var
  JobForm: TJobForm;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI,
  Base.Integrity,
  Base.Container,
  Presentation.Modules.Data,
  App.Common.Messaging;

{ TJobForm }

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobForm.btnSaveClick(Sender: TObject);
begin
  fJob.Applied := cbxApplied.Checked;
  fJob.Notes   := txtNotes.Text;

  fRepository.Save(fJob);

  var e := TJobUpdatedEvent.Create(fId);
  var group := TJobEvent.Create;

  JobsEventBus.Publish<TJobUpdatedEvent, TJobEvent>(e, group);

  ModalResult := mrOk;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobForm.Initialize(const aId: integer);
const
  HTML =  '''
          <!DOCTYPE html>
          <html>
          <head>
          <style>
            body {
              background-color: #121212;
              color: #e0e0e0;
              font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
              display: flex;
              justify-content: center;
              padding: 40px;
            }
            .job-card {
              background-color: #1e1e1e;
              border: 1px solid #333;
              border-radius: 8px;
              padding: 24px;
              width: 100%;
              max-width: 500px;
              box-shadow: 0 4px 12px rgba(0,0,0,0.5);
            }
            .job-title {
              color: #bb86fc;
              font-size: 1.5em;
              margin-bottom: 4px;
              font-weight: bold;
            }
            .company-info {
              color: #03dac6;
              font-weight: 500;
              margin-bottom: 16px;
            }
            .details-grid {
              display: grid;
              grid-template-columns: auto 1fr;
              gap: 8px 16px;
              margin-bottom: 20px;
              font-size: 0.95em;
            }
            .label {
              color: #999;
              text-transform: uppercase;
              font-size: 0.8em;
              letter-spacing: 0.5px;
            }
            .description {
              line-height: 1.6;
              border-top: 1px solid #333;
              padding-top: 16px;
              color: #b0b0b0;
              word-wrap: break-word;
              max-height: 300px;
              overflow-y: auto;
              scrollbar-width: thin;
              scrollbar-color: #333 transparent;
            }
            .apply-link {
              display: inline-block;
              margin-top: 0px;

              margin-left: -5px;
              color: #bb86fc;
              text-decoration: none;
              border: 1px solid #bb86fc;
              padding: 8px 16px;
              border-radius: 4px;
              transition: 0.3s;
            }
            .apply-link:hover {
              background-color: #bb86fc;
              color: #121212;
            }
          </style>
          </head>
          <body>

          <div class="job-card">
            <!-- Title & Company -->
            <div class="job-title">[TITLE]</div>
            <div class="company-info">[COMPANY]</div>

            <!-- Grid for Min/Max Salary & Location -->
            <div class="details-grid">
              <div class="label">Location</div>
              <div>[LOCATION]</div>

              <div class="label">Salary</div>
              <div>[MIN] (Min) - [MAX] (Max)</div>
            </div>

            <!-- Description -->
            <div class="description">
              [DESCRIPTION]
            </div>

            <br/>

            <!-- URL Hyperlink -->
            <a href="[URL]" class="apply-link" target="_blank">View Full Posting</a>
          </div>

          </body>
          </html>
          ''';
begin
  fRepository := DataDataModule.JobRepository;

  fId  := aId;
  fJob := fRepository.GetBy(fId).Value;

  var page := HTML.Replace('[TITLE]', fJob.Title)
                  .Replace('[COMPANY]', fJob.Company)
                  .Replace('[LOCATION]', fJob.Location)
                  .Replace('[MIN]', IntToStr(fJob.MinSalary))
                  .Replace('[MAX]', IntToStr(fJob.MaxSalary))
                  .Replace('[DESCRIPTION]', fJob.Description)
                  .Replace('[URL]', fJob.Url);

  htJobDetails.HTML.Text := page;

  cbxApplied.Checked := fJob.Applied;
  txtNotes.Text := fJob.Notes;
end;

{----------------------------------------------------------------------------------------------------------------------}
class procedure TJobForm.Execute(const aId: integer);
var
  scope: TScope;
begin
  var dlg := scope.Owns(TJobForm.Create(nil));

  dlg.Initialize(aId);
  dlg.ShowModal;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TJobForm.htJobDetailsUrlClick(Sender: TElement);
begin
  // we could get this from the fJob, but it is a nice opportunity to work with HtPanel.
  var url := Sender.Attributes.Attr['href'];

  // ask the operate system to show the url
  ShellExecute(0, nil, PChar(url), nil, nil, SW_SHOWNORMAL);
end;

end.
