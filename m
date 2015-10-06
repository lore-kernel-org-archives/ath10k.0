Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjQfO-0005Ag-SO
 for ath10k@lists.infradead.org; Tue, 06 Oct 2015 11:44:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: implement debugfs interface for Transmit
 Power Control stats
References: <20150918075706.6983.11216.stgit@potku.adurom.net>
Date: Tue, 6 Oct 2015 14:43:50 +0300
In-Reply-To: <20150918075706.6983.11216.stgit@potku.adurom.net> (Kalle Valo's
 message of "Fri, 18 Sep 2015 10:58:22 +0300")
Message-ID: <87d1ws2pe1.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> This implements a simple interface for debugging TPC stats. I did a small hack
> to sparse to check endian usage with signed 32 bit values.
>
> ---
>
> Kalle Valo (1):
>       ath10k: add a_sle32_to_cpu()
>
> Maharaja Kennadyrajan (1):
>       ath10k: implement debugfs interface for Transmit Power Control stats

Applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
