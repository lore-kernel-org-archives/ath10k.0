Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1yX7-0002q7-1o
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 15:00:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V2] ath10k: add 'cryptmode' param to support raw tx
 injection and sw crypto.
References: <1433440033-49570-1-git-send-email-cfliu.tw@gmail.com>
Date: Mon, 8 Jun 2015 17:59:40 +0300
In-Reply-To: <1433440033-49570-1-git-send-email-cfliu.tw@gmail.com> (Liu CF's
 message of "Thu, 4 Jun 2015 10:47:13 -0700")
Message-ID: <87pp56gs9v.fsf@kamboji.qca.qualcomm.com>
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
To: Liu CF/TW <cfliu.tw@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Liu CF/TW <cfliu.tw@gmail.com> writes:

> This change supports bypassing HW crypto engine by enabling raw Rx/Tx mode.
> This will enable use cases such as sw crypto and raw tx injection.
> This change introduces a new module param 'cryptmode'.

Please use full words, eg. sw -> software, hw -> hardware

> cryptmode:
>
>  0    Use HW crypto engine. Use native WiFi mode Tx/Rx encap

"Use hardware crypto engine with native Wi-Fi mode TX/RX encapsulation
to the firmware"

>  1    Use SW crypto engine. Use raw mode Tx/Rx encap

"Use sofware crypto engine from mac80211 with raw mode TX/RX
encapsulation to the firmware"

>  2    Supports both SW & HW crypto engine. Use raw mode Tx/Rx encap.

It's not clear how to use this. How does the user choose between SW or
HW crypto modes? Please document that fully in the commit log.

>  ath10k
>  cryptmode
>  param      Testing Status
>  -------    ---------------------------------
>     0       HW CCMP/TKIP tested ok.
>             Note: HW crypto bypass not supported by ath10k hw in native WiFi
>             mode.

What's "HW crypto bypass"? Please write the commit log so that everyone
can understand it.

>     1       - mac80211 SW crypto tested ok.
>             - raw Tx frame injection tested ok.

What does "mac80211 SW crypto tested ok" exactly mean?

>     2       HW CCMP/TKIP tested ok.
>             SW CCMP/TKIP tested ok.

How were the HW and SW modes chosen?

>             Tested raw Tx encrypted frame injection ok.

With HW or SW crypto mode?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
