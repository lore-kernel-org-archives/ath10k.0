Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an5x6-0001os-IT
 for ath10k@lists.infradead.org; Mon, 04 Apr 2016 14:58:05 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: parse Rx MAC timestamp in mgmt frame for FW
 10.4
Date: Mon, 4 Apr 2016 14:57:40 +0000
Message-ID: <87zit9ctgb.fsf@kamboji.qca.qualcomm.com>
References: <20caae0068a19c546f87ef4a25e3651af92c02ab.1458686620.git.poh@qca.qualcomm.com>
In-Reply-To: <20caae0068a19c546f87ef4a25e3651af92c02ab.1458686620.git.poh@qca.qualcomm.com>
 (Peter Oh's message of "Tue, 22 Mar 2016 15:44:53 -0700")
Content-Language: en-US
Content-ID: <7F5E96288889A7438D52D1643B8F0B5A@qualcomm.com>
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

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
