Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6dep-00076N-15
 for ath10k@lists.infradead.org; Mon, 23 Oct 2017 14:24:48 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
Date: Mon, 23 Oct 2017 14:24:06 +0000
Message-ID: <fb5f8df1-aa9a-2646-5f98-afc852acce5c@qti.qualcomm.com>
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
In-Reply-To: <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
Content-Language: en-US
Content-ID: <3BE154895B651946B0D8D6D5D9351683@qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On Saturday 21 October 2017 01:41 AM, Sebastian Gottschall wrote:
> i suggest the following patch on top of yours. please tell me if my thoughts are correct here. its mainly a guess

I agree we need to take care of this for newly added ciphers as well. How about making it as a separate patch 
to make the patch bit smaller and to reduce the difficulties in back porting it for ciphers supported for long 
time?

Vasanth
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
