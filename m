Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adDzL-00040L-BP
 for ath10k@lists.infradead.org; Tue, 08 Mar 2016 09:31:35 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: parse Rx MAC timestamp in mgmt frame for FW 10.4
Date: Tue, 8 Mar 2016 09:31:11 +0000
Message-ID: <87a8m9s4dk.fsf@kamboji.qca.qualcomm.com>
References: <1456513531-14528-1-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1456513531-14528-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Fri, 26 Feb 2016 11:05:31 -0800")
Content-Language: en-US
Content-ID: <174798617A536E40A12AF82A680EB0FE@qualcomm.com>
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
To: "Oh, Peter" <poh@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Peter Oh <poh@qca.qualcomm.com> writes:

> Check and parse Rx MAC timestamp when firmware sets its flag
> to status variable.
> 10.4 firmware adds it in Rx beacon frame only at this moment.
> Drivers and mac80211 may utilize it to detect such clockdrift
> or beacon collision and use the result for beacon collision
> avoidance.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Like kbuild noticed this fails to build:

drivers/net/wireless/ath/ath10k/wmi.c: In function 'ath10k_wmi_10_4_op_pull_mgmt_rx_ev':
drivers/net/wireless/ath/ath10k/wmi.c:2236:40: error: 'WMI_RX_STATUS_EXT_INFO' undeclared (first use in this function)
drivers/net/wireless/ath/ath10k/wmi.c:2236:40: note: each undeclared identifier is reported only once for each function it appears in
drivers/net/wireless/ath/ath10k/wmi.c:2239:24: error: 'struct wmi_mgmt_rx_ev_arg' has no member named 'ext_info'
drivers/net/wireless/ath/ath10k/wmi.c:2239:53: error: invalid application of 'sizeof' to incomplete type 'struct wmi_mgmt_rx_ext_info' 

Please resend.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
