Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from server14-mail.hostwhitelabel.com ([104.152.168.114]
 helo=server14.hostwhitelabel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCWNl-00041M-0l
 for ath10k@lists.infradead.org; Tue, 07 Jul 2015 17:10:09 +0000
From: CACook@quantum-sci.com
Subject: Re: [PATCH 3/3] ath10k: add support for qca99x0 Rx descriptors
Date: Tue, 07 Jul 2015 10:09:38 -0700
Message-ID: <2345251.lpvZM96hbt@andromeda>
In-Reply-To: <1436287676-25767-4-git-send-email-poh@qca.qualcomm.com>
References: <1436287676-25767-1-git-send-email-poh@qca.qualcomm.com>
 <1436287676-25767-4-git-send-email-poh@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Peter Oh <poh@qca.qualcomm.com>

On Tuesday 07 July 2015 9:47:56 Peter Oh wrote:
> QCA99X0 chip has an extra 4 bytes in rx_msdu_start,
> 20 bytes in rx_msdu_end and 20 bytes in rx_ppdu_end structure
> which are used in htt_rx_desc and HTT Rx ring offset setup.
> This is necessary for correct Rx for QCA99X0 or Rx descriptors
> will be overwritten and corrupted.

Will this be in the most recent git, to support the QCA9880?



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
