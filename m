Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6yAe-0005ih-Rc
 for ath10k@lists.infradead.org; Tue, 15 Jul 2014 08:33:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: pci fixes 2014-06-05
References: <1401954520-3365-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 15 Jul 2014 11:22:41 +0300
In-Reply-To: <1401954520-3365-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 5 Jun 2014 09:48:38 +0200")
Message-ID: <87d2d7ghf2.fsf@kamboji.qca.qualcomm.com>
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

> I've found a few issues while I was testing ath10k
> in QEMU/KVM with PCI passthrough. The second patch
> is something that I've found while analysing the
> bmi race and I don't think anyone experienced
> problems associated with it.
>
> There's still a weird synchronization issue with
> (what I think is) iomap write propagation. The
> initial fw bootup interrupt doesn't come in and
> it seems CE interrupts are unmasked with a lag
> because explicit polling after ctl_resp timeout
> seems to be sufficient to work around it. I
> suspect this might be a virtualization problem
> rather than ath10k. Ideas, anyone?

No ideas, but it would be great to get ath10k working in KVM. If we
cannot find a better solution, could we add the explicit polling anyway?
(With an approriate comment why such a hack is needed, of course)

> Michal Kazior (2):
>   ath10k: fix bmi exchange tx/rx race
>   ath10k: sanitize tx ring index access properly

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
