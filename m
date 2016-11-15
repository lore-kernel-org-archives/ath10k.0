Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6dxb-0003bm-1U
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 13:39:40 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] dt: bindings: add new dt entry for BTCOEX feature in
 qcom, ath10k.txt
Date: Tue, 15 Nov 2016 13:39:08 +0000
Message-ID: <87twb8q2v8.fsf@kamboji.qca.qualcomm.com>
References: <1478617462-28188-1-git-send-email-c_traja@qti.qualcomm.com>
In-Reply-To: <1478617462-28188-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Tue, 8 Nov 2016 20:34:22 +0530")
Content-Language: en-US
Content-ID: <A3614307848C1144B7EB6F0907F4D7F7@qualcomm.com>
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
To: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "tamizhchelvam@codeaurora.org" <tamizhchelvam@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

(Adding devicetree list)

<c_traja@qti.qualcomm.com> writes:

> From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
>
> There two things done in this patch.
>
> 1) 'btcoex_support' flag for BTCOEX feature support by the hardware.
> 2) 'wlan_btcoex_gpio' is used to fill wlan priority pin number for
>    BTCOEX priority feature support.
>
> Signed-off-by: Tamizh chelvam <tamizhchelvam@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          |    4 ++++
>  1 file changed, 4 insertions(+)

As this changes the device tree bindings you need to CC the device tree
list. Please resend the whole patchset (and mark it as v2).

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
