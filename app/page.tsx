// labels for the career statistics cards.
// actual totals will be added when match data is connected

const statisticLabels = [
  "Appearances",
  "Goals",
  "Assists",
  "Hat-tricks",
  "Yellow Cards",
  "Red Cards",
  "Wins",
  "Draws",
  "Losses",
  "Trophies",
];

//display the PitchLog homepage.(No Database Funcionality yet)
export default function Home() {
  return(
    <main className="flex min-h-screen bg-slate-950 px-6 py-12 text-slate-100">
      <div className="mx-0 auto max-w-6xl">
        {/* Project title and introduction */}
        <header className="mb-12 border-b border-slate-800 pb-8">
          <p className="mb-3 text-sm font-semibold uppercase tracking-widest text-emerald-400">
            My soccer journey
          </p>

          <h1 className="text-4xl font-bold tracking-tight sm:text-5xl">
            PitchLog
          </h1>

          <p className="mt-4 max-w-2xl text-lg leading-8 text-slate-400">
            Track my matches, compare performances across leagues, and
            celebrate personal milestones.
          </p>
        </header>

        {/* Career statistics: placeholders until real data is available */}
        <section aria-labelledby="statistics-heading">
          <h2
            id="statistics-heading"
            className="text-2xl font-semibold"
          >
            Career overview
          </h2>

          <p className="mt-2 text-sm leading-6 text-slate-400">
            Statistics will appear here once match records are connected.
          </p>

          <div className="mt-6 grid grid-cols-2 gap-4 md:grid-cols-4">
            {/* Create a card for each label instead of repeating the markup. */}
            {statisticLabels.map((label) => (
              <div
                key={label}
                className="rounded-xl border border-slate-800 bg-slate-900 p-5"
              >
                <h3 className="text-sm font-medium text-slate-400">
                  {label}
                </h3>

                <p className="mt-3 text-3xl font-bold text-emerald-400">
                  {/* Show a dash, not a zero that could imply a real total. */}
                  <span aria-hidden="true">—</span>
                  <span className="sr-only">Not available yet</span>
                </p>
              </div>
            ))}
          </div>
        </section>

        {/* Match history: the table and match records will be added later */}
        <section
          aria-labelledby="matches-heading"
          className="mt-10 rounded-xl border border-slate-800 bg-slate-900 p-6"
        >
          <h2
            id="matches-heading"
            className="text-xl font-semibold"
          >
            Match history
          </h2>

          <p className="mt-3 leading-7 text-slate-400">
            Review match results, goals, assists, and performances by
            league and season.
          </p>

          <div className="mt-6 rounded-lg border border-dashed border-slate-700 px-6 py-10 text-center">
            <h3 className="font-medium text-slate-200">
              Match log coming next
            </h3>

            <p className="mt-2 text-sm leading-6 text-slate-400">
              This is the initial layout. No match data is connected yet.
            </p>
          </div>
        </section>

        {/* Project footer */}
        <footer className="mt-10 border-t border-slate-800 pt-6 text-sm text-slate-500">
          PitchLog · Personal soccer statistics tracker
        </footer>
      </div>
    </main>
  );
}