Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFgdv-0000DJ-6i
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 09:39:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 0/3] ath10k: ce fixes 2014-08-08
References: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 8 Aug 2014 12:38:54 +0300
In-Reply-To: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 8 Aug 2014 11:22:12 +0200")
Message-ID: <87ppgbz5g1.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This removes implicit endianess in some places.
> I'd love to get rid of it from
> ath10k_pci_diag_access* as well but let's fix
> ath10k_pci_diag_mem_* first.
>
> @Kalle, @Ben: As far as I understand this
> conflicts with fw dumping you work on so I'm
> tentatively posting this as an RFC first.

Yeah, and I have done some ath10k_pci_diag_ changes in Ben's patches. It
would be easier if you could rebase your patches on top of ben's
firmware crash patches, which I should be able to submit today for first
review.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
