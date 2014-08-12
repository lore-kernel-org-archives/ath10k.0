Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XH6pf-000486-P4
 for ath10k@lists.infradead.org; Tue, 12 Aug 2014 07:49:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2 0/2] ath10k: scan fixes 2014-07-21
References: <1407243284-19803-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 12 Aug 2014 10:48:57 +0300
In-Reply-To: <1407243284-19803-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 5 Aug 2014 14:54:42 +0200")
Message-ID: <87tx5iqhau.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This addresses an issue found by Janusz with
> current spectral scan patches from Simon.
>
> This goes along patch `ath10k: prevent endless pci rx
> loop` I've posted a few days ago.
>
> There seems to be a condition in firmware which
> causes some WMI events to be not delivered by
> firmware to host most likely due to CE/PCI pipe
> being full (that's a guess judging by the huge
> amount of phyerrs reported and their behaviour
> while spectral scan is enabled). This also
> suggests some SWBA events may be dropped by
> firmware when spectral scan is running (same goes
> for management rx).
>
> v2:
>  * addressed some comments from Kalle
>  * fixed a few more issues
>
>
> Michal Kazior (2):
>   ath10k: simplify scan debug prints
>   ath10k: introduce a stricter scan state machine

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
