Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFhvu-0000jM-4V
 for ath10k@lists.infradead.org; Wed, 22 Jun 2016 13:11:06 +0000
Received: by mail-io0-x22f.google.com with SMTP id s63so39387894ioi.3
 for <ath10k@lists.infradead.org>; Wed, 22 Jun 2016 06:10:45 -0700 (PDT)
From: Tom Marble <tmarble@info9.net>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
In-Reply-To: <87y45xiuts.fsf@kamboji.qca.qualcomm.com>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 22 Jun 2016 08:10:34 -0500
Message-ID: <57dd1n9mks5.fsf@cerise.info9.net>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Tom Marble <tmarble@info9.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Valo, Kalle" <kvalo@qca.qualcomm.com> writes:
> Do you have CONFIG_ATH10K_DFS_CERTIFIED enabled?

No.. the option isn't even commented out in my .config??
Is there are tree other than...
  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git

> Also check that that
> regulatory is correct with 'iw reg get' and 'iw phy0 info', especially
> that 80 MHz channels are supported.

root@six:/# iw reg get
country US: DFS-FCC
        (2402 - 2472 @ 40), (N/A, 30), (N/A)
        (5170 - 5250 @ 80), (N/A, 17), (N/A)
        (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS
        (5735 - 5835 @ 80), (N/A, 30), (N/A)
        (57240 - 63720 @ 2160), (N/A, 40), (N/A)
root@six:/#

(I cannot run 'iw phy0 info' at the moment as I'm away from the lab)

> Also I would try first without DFS on channel 36 just to make it easier
> to pinpoint the problem.

Okay, thanks!

--Tom

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
