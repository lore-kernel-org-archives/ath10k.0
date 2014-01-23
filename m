Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6JoE-00008f-9A
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 12:55:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: enable firmware STA quick kickout
References: <20140120090146.5500.12995.stgit@potku.adurom.net>
Date: Thu, 23 Jan 2014 14:54:33 +0200
In-Reply-To: <20140120090146.5500.12995.stgit@potku.adurom.net> (Kalle Valo's
 message of "Mon, 20 Jan 2014 11:01:46 +0200")
Message-ID: <87ob325052.fsf@kamboji.qca.qualcomm.com>
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

> Firmware has a feature to track if the associated STA is not acking the frames.
> When that happens, the firmware sends WMI_PEER_STA_KICKOUT_EVENTID event to the
> host. Enable that to faster detect when a STA has left BSS without sending a
> deauth frame.
>
> Also set huge keepalive timeouts to avoid using the keepalive functionality in
> the firmware.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
