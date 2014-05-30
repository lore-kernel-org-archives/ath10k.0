Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqJwT-0003CF-U1
 for ath10k@lists.infradead.org; Fri, 30 May 2014 10:21:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Pull request: ath 20140530
References: <87vbsn4q5d.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 30 May 2014 13:21:09 +0300
In-Reply-To: <87vbsn4q5d.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Fri, 30 May 2014 11:38:54 +0300")
Message-ID: <87egzb4lex.fsf@kamboji.qca.qualcomm.com>
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
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Hi John,
>
> here's a new pull request for ath10k and also a small change for ath9k.
> I'm hoping to get these still to 3.16. The changelog is:
>
> ----------------------------------------------------------------------
> Ben added support for setting antenna configurations. Michal improved
> warm reset so that we would not need to fall back to cold reset that
> often, an issue where ath10k stripped protected flag while in monitor
> mode and made module initialisation asynchronous to fix the problems
> with firmware loading when the driver is linked to the kernel.
>
> Luca removed unused channel_switch_beacon callbacks both from ath9k and
> ath10k. Marek fixed Protected Management Frames (PMF) when using Action
> Frames. Also we had other small fixes everywhere in the driver.
> ----------------------------------------------------------------------
>
> Please let me know if there are any problems.
>
> Kalle
>
>
> The following changes since commit 5f407acbb7d6a92841c455b37a6ad4833757740e:
>
>   rsi: Changed the return value to enable BA set-up (2014-05-13 15:56:53 -0400)
>
> are available in the git repository at:
>
>   git://github.com/kvalo/ath.git tags/for-linville-20140530

Sorry, this was supposed to be:

    git://github.com/kvalo/ath.git for-linville

I don't know why 'git request-pull' always puts the name of tag here
even when I provide it the branch name. Oh well.

> for you to fetch changes up to 08b8aa0931830cc4b96b47f884fe623aef5c4b84:

But they both point to this same commit, so there should be no problem.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
