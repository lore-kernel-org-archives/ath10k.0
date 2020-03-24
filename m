Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGiUt-0006jx-R4
 for ath10k@lists.infradead.org; Tue, 24 Mar 2020 12:17:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA6174 - failed to fetch board data
References: <b10a2a73-b6a2-8ed5-95f9-600b7c7710db@gmail.com>
Date: Tue, 24 Mar 2020 14:17:25 +0200
In-Reply-To: <b10a2a73-b6a2-8ed5-95f9-600b7c7710db@gmail.com> (Tim Klicks's
 message of "Thu, 19 Mar 2020 19:43:38 +0100")
Message-ID: <87blom7xre.fsf@kamboji.qca.qualcomm.com>
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
To: Tim Klicks <tim.klicks@gmail.com>
Cc: ath10k@lists.infradead.org

Tim Klicks <tim.klicks@gmail.com> writes:

> I am running Fedora 31 on my Redmibook 14 and I am facing a problem
> regarding the wifi.
> The wifi is not working when using any linux-firmware package provided.
> Neither the one coming via the official update channel nor cloning the
> git repo and using the master branch is helping.
> The only way to get it to work was by following this Gentoo Linux KB
> article:
> https://wiki.gentoo.org/wiki/Qualcomm_Atheros_QCA6174
> Which is pointing to this github pull request:
> https://github.com/kvalo/ath10k-firmware/pull/3
>
> Although wifi is working with this workaround, could you please check
> how much work it would be to integrate this fix into the mainline
> package?

Sorry, no time to check the details on your problem but if this is about
a missing board file please submit them using these instructions:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

Do note that I have like 20 board file submissions pending, but I'll get
to them eventually.

I don't deal with pull requests as it's very hard to diff binary file
changes, I wish I could disable the pull request feature on github
altogether but have not figured out how to do that.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
