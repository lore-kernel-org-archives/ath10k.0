Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from magratgarlick.emantor.de ([2a01:4f8:c17:c88::2]
 helo=margratgarlick.emantor.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e41M5-0000q6-95
 for ath10k@lists.infradead.org; Mon, 16 Oct 2017 09:06:40 +0000
References: <5a4860eb-3734-7587-d81f-9c3de6ff11c8@leemhuis.info>
 <46f918c5-b07d-e397-2f3d-8136c7c1a8f3@qti.qualcomm.com>
 <fa6e3ee2-91b5-a54b-afe3-87f30aac7a48@leemhuis.info>
From: Rouven Czerwinski <rouven@czerwinskis.de>
Subject: Re: ath10k-regression due to "ath10k: fix napi_poll budget overflow"
 c9353bf483d3
In-Reply-To: <fa6e3ee2-91b5-a54b-afe3-87f30aac7a48@leemhuis.info>
Date: Mon, 16 Oct 2017 11:04:51 +0200
Message-ID: <87zi8rv4y4.fsf@czerwinskis.de>
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
Cc: Ryan Hsu <ryanhsu@qti.qualcomm.com>, Thorsten Leemhuis <linux@leemhuis.info>

Hello,

here is my analysis of the problem:
Commit c9353bf483d3 plumps the budget down into the
ath10k_htt_rx_extract_amsdu function. Per extracted msdu frame the
budget is reduced by one until either we have no budget left or all
msdus are extracted from the amsdu. The function then checks whether all
frames were extracted, if not it returns -EAGAIN.

The error happens if we have to extract more frames then we have
budget_left, because not all frames are extracted and
ath10k_htt_rx_in_ord_ind enters this error path:

case -EAGAIN:
	/* fall through */
default:
	/* Should not happen. */
	ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
	htt->rx_confused = true;
	__skb_queue_purge(&list);
	return -EIO;

Which is not recoverable by the driver, only through hardware reset.

MfG
Rouven Czerwinski

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
