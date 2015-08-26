Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUVmg-0002jn-5n
 for ath10k@lists.infradead.org; Wed, 26 Aug 2015 08:10:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add spectral scan support for 10.4 fw
References: <1440046745-428-1-git-send-email-rmani@qti.qualcomm.com>
Date: Wed, 26 Aug 2015 11:09:46 +0300
In-Reply-To: <1440046745-428-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Thu, 20 Aug 2015 10:29:05 +0530")
Message-ID: <87k2si31yt.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> To enable/configure spectral scan parameters in 10.4 firmware, existing
> wmi spectral related functions can be reused. Link those functions in
> 10.4 wmi ops table.
>
> In addition, adjust bin size (only when size is 68 bytes) before reporting
> bin samples to user space. The background for this adjustment is that
> qca99x0 reports bin size as 68 bytes (64 bytes + 4 bytes) in report
> mode 2. First 64 bytes carries in-band tones (-32 to +31) and last 4 byte
> carries band edge detection data (+32) mainly used in radar detection
> purpose. Additional last 4 bytes are stripped to make bin size valid one.
>
> This bin size adjustment will happen only for qca99x0, all other chipsets
> will report proper bin sizes (64/128) without extra 4 bytes being added
> at the end. The changes are validated in qca99x0 using 10.4 firmware.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
