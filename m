Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ekpQi-0007aQ-FN
 for ath10k@lists.infradead.org; Sun, 11 Feb 2018 11:04:21 +0000
From: Carl Huang <cjhuang@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait
Date: Sun, 11 Feb 2018 11:03:48 +0000
Message-ID: <77aae4b4bdd44043b30cd7075537630a@aptaiexm02f.ap.qualcomm.com>
References: <1518317805-5796-1-git-send-email-cjhuang@codeaurora.org>
 <3995aa0a-00f0-5ca1-fc49-1fad141fb2ae@nbd.name>
In-Reply-To: <3995aa0a-00f0-5ca1-fc49-1fad141fb2ae@nbd.name>
Content-Language: en-US
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
To: "nbd@nbd.name" <nbd@nbd.name>, Carl Huang <cjhuang@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>



> -----Original Message-----
> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Felix
> Fietkau
> Sent: Sunday, February 11, 2018 5:59 PM
> To: Carl Huang <cjhuang@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCH] ath10k: fix use-after-free in
> ath10k_wmi_cmd_send_nowait
> 
> On 2018-02-11 03:56, Carl Huang wrote:
> > The skb may be freed in tx completion context before
> > trace_ath10k_wmi_cmd is called. This can be easily captured when
> > KASAN(Kernel Address Sanitizer) is enabled. The fix is to add a
> > reference count to the skb and release it after trace_ath10k_wmi_cmd
> > is called.
> >
> > Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> I think it makes more sense to simply call the trace function before
> ath10k_htc_send. Also, for a trivial change like this it probably does not make
> sense to add a Copyright line either.
> 
Agree that Moving the trace function before ath10k_htc_send is more simple, but then the parameter ret 
has no meaning and can't trace the return value of ath10k_htc_send.  Besides that, skb->data and skb->len 
have different value if putting trace function before ath10k_htc_send, and this may be fine since the main
purpose is to trace the wmi information and not htc header information.

For the Copyright line, need Kalle Valo to comment. 

> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
