Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCa9W-000650-72
 for ath10k@lists.infradead.org; Tue, 07 Jul 2015 21:11:42 +0000
Message-ID: <559C402B.3090004@codeaurora.org>
Date: Tue, 07 Jul 2015 14:10:03 -0700
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath10k: add support for qca99x0 Rx descriptors
References: <1436287676-25767-1-git-send-email-poh@qca.qualcomm.com>
 <1436287676-25767-4-git-send-email-poh@qca.qualcomm.com>
 <2345251.lpvZM96hbt@andromeda>
In-Reply-To: <2345251.lpvZM96hbt@andromeda>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: CACook@quantum-sci.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Peter Oh <poh@qca.qualcomm.com>


On 07/07/2015 10:09 AM, CACook@quantum-sci.com wrote:
> On Tuesday 07 July 2015 9:47:56 Peter Oh wrote:
>> QCA99X0 chip has an extra 4 bytes in rx_msdu_start,
>> 20 bytes in rx_msdu_end and 20 bytes in rx_ppdu_end structure
>> which are used in htt_rx_desc and HTT Rx ring offset setup.
>> This is necessary for correct Rx for QCA99X0 or Rx descriptors
>> will be overwritten and corrupted.
> Will this be in the most recent git,
Yes. this patch set is based on top of most recent git.
>   to support the QCA9880?
QCA9880 is already supported and this patch set is to support QCA99X0.
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
