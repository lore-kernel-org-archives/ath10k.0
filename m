Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuTKK-0003mn-QO
 for ath10k@lists.infradead.org; Fri, 28 Nov 2014 21:43:45 +0000
Received: by mail-ie0-f180.google.com with SMTP id rp18so6379813iec.25
 for <ath10k@lists.infradead.org>; Fri, 28 Nov 2014 13:43:21 -0800 (PST)
Message-ID: <5478EC76.40102@gmail.com>
Date: Fri, 28 Nov 2014 16:43:18 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
Subject: Fix me in htc.c relating to skb_reserve
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Greetings Kalle, John and others,
I am wondering why this file is complaining about the code below, if someone can explain to me the issue I would be 
very glad :).
 static struct sk_buff *ath10k_htc_build_tx_ctrl_skb(void *ar)
{
       struct sk_buff *skb;
       struct ath10k_skb_cb *skb_cb;

       skb = dev_alloc_skb(ATH10K_HTC_CONTROL_BUFFER_SIZE);
       if (!skb)
               return NULL;

  skb_reserve(skb, 20); /* FIXME: why 20 bytes? */
  WARN_ONCE((unsigned long)skb->data & 3, "unaligned skb");

  skb_cb = ATH10K_SKB_CB(skb);
  memset(skb_cb, 0, sizeof(*skb_cb));

  ath10k_dbg(ar, ATH10K_DBG_HTC, "%s: skb %p\n", __func__, skb);
  return skb;
}

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
