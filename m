Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKVvF-0005Cj-Jt
 for ath10k@lists.infradead.org; Mon, 03 Mar 2014 16:40:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: unify warning messages in mac.c
References: <20140303154327.1290.67278.stgit@potku.adurom.net>
 <CA+BoTQmQndikH5uPDwBpstp9KmcD3tmHSGP5NpEreYEOtRm0sw@mail.gmail.com>
Date: Mon, 3 Mar 2014 18:40:22 +0200
In-Reply-To: <CA+BoTQmQndikH5uPDwBpstp9KmcD3tmHSGP5NpEreYEOtRm0sw@mail.gmail.com>
 (Michal Kazior's message of "Mon, 3 Mar 2014 17:23:24 +0100")
Message-ID: <8761nv44nd.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 3 March 2014 16:43, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Currently there are different styles used for warning messages, unify them to
>> look similar.
>>
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>> ---
>
> [...]
>
> This still seems inconsistent.

Sure. What I did here was that I just capitalised them messages and made
sure that return code is printed in format ": %d\n".

> I also don't like the capital letters (even for abbreviations) in
> these kind of messages, but that's just my OCD..

I'm fine with starting a lower case letter. For me most important is
that the messages follow the same style.

> I think we should agree on one of the two approaches:
>
> a) start with a verb:
>
> "failed to add peer %pM on vdev %i: %d"
> "failed to initialize dfs pattern detector"
> "timed out while waiting for scan completion"
>
> b) start with a noun:
>
> "peer %pM on vdev %i could not be added: %d"
> "dfs pattern detector could not initialize"
> "scan timed out"
>
> These are still mixed.
>
> We could probably also limit the set of verbs, e.g. replace "could
> not" with "failed to" as it's practically the same thing (assuming we
> pick (a)).

That's true. I would vote for option (a).

> But then again, feel free to ignore my OCD :-)

Hehe, I had to even google that :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
