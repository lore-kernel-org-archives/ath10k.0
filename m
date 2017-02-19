Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfURM-0000g5-HD
 for ath10k@lists.infradead.org; Sun, 19 Feb 2017 16:34:27 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 0/8] ath10k sdio support
Date: Sun, 19 Feb 2017 16:33:55 +0000
Message-ID: <87tw7q2l8v.fsf@qca.qualcomm.com>
References: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
 <87fujbhb29.fsf@kamboji.qca.qualcomm.com>
 <1c87e0d1-1f14-08bb-2a69-650788fba8dc@gmail.com>
 <877f4ngii5.fsf@kamboji.qca.qualcomm.com>
 <8737fagu28.fsf@kamboji.qca.qualcomm.com>
 <e8e1a379-129a-a8c3-9e1f-fb4c70fd0ab6@gmail.com>
In-Reply-To: <e8e1a379-129a-a8c3-9e1f-fb4c70fd0ab6@gmail.com> (Erik
 Stromdahl's message of "Sun, 19 Feb 2017 17:21:43 +0100")
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Ok, I'll do another round of checkpatch before I submit anything.
> I couldn't find the script you mentioned though (ath10k-check).

Did you check the link I gave you:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#checking_code

> Is it some kind of checkpatch wrapper?

It runs various tests (gcc, sparse, checkpatch), sets some checkpatch
settings (like line length) and filters out warnings we don't care
about.

> Anyway, I have a few warnings related to 'line over 80 chars' that
> is really hard to get rid of (without breaking indentation etc.) so
> I won't do anything about those for now.
>
> Then there are some other warnings about the BIT macro being preferred
> over (1 << x). I have used (1 << x) in some files despite the checkpatch
> warning in order to keep the patches consistent with the existing code.
> I think the best approach is to have a separate round of cleanup-patches
> replacing all (1 << x) with BIT(x).

These are all disabled by ath10k-check. I think it's easiest that you
forget ath10k-check for now and let me fix those in the next round.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
