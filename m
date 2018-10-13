Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway23.websitewelcome.com ([192.185.48.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBOcy-0004Jk-Au
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 18:27:05 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 815127A4A
 for <ath10k@lists.infradead.org>; Sat, 13 Oct 2018 13:26:40 -0500 (CDT)
Subject: Re: [PATCH] ath10k: htt_rx: Fix signedness bug in
 ath10k_update_per_peer_tx_stats
References: <20181005184245.GA11700@embeddedor.com>
 <20181013172330.1CC8E60BFE@smtp.codeaurora.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <832fd7db-4e67-b757-d1bb-dbc109a90571@embeddedor.com>
Date: Sat, 13 Oct 2018 20:26:34 +0200
MIME-Version: 1.0
In-Reply-To: <20181013172330.1CC8E60BFE@smtp.codeaurora.org>
Content-Language: en-GB
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org


On 10/13/18 7:23 PM, Kalle Valo wrote:
> 
> Patch applied to ath-next branch of ath.git, thanks.
> 
> 9d9cdbf3f9ed ath10k: htt_rx: fix signedness bug in ath10k_update_per_peer_tx_stats
> 

Thank you, Kalle.
--
Gustavo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
