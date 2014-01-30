Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8mlc-0005BZ-BX
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 08:14:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: configure access category for arp
References: <1390999696-8895-1-git-send-email-marek.puzyniak@tieto.com>
Date: Thu, 30 Jan 2014 10:14:06 +0200
In-Reply-To: <1390999696-8895-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Wed, 29 Jan 2014 13:48:16 +0100")
Message-ID: <87mwidyjht.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> ARP frames exchange does not work properly for UAPSD enabled AP.
> ARP requests which arrives with access category 0 are processed
> by network stack and send back with access category 0. FW changes
> access category to 6. This is causing problems when UAPSD associated
> STA is sleeping after has sent ARP request. Configure ARP access
> category in FW to best effort (0) solves this problem. ARP frames
> will be send with access category 0.
>
> Simplify arp ac override functionality by removing redundant entry in
> pdev param maping table. There should be only one entry in pdev param
> map but enum has different name for different FW.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
