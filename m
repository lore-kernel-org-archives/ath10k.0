Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB2N0-0002AS-KY
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 14:22:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH RESEND] ath10k: Fix potential Rx ring corruption
References: <1420823986-29503-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Tue, 13 Jan 2015 16:22:26 +0200
In-Reply-To: <1420823986-29503-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Fri, 9 Jan 2015 22:49:46
 +0530")
Message-ID: <878uh669r1.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> When replenishing Rx buffers driver updates the address of the
> buffer and the index of rx buffer in rx ring to the firmware.
> Change in order by CPU can cause rx ring corruption. Add memory
> barrier before updating rx buffer index to guarantee the order.
>
> This could fix some instances of rx ring corruption due to done
> bit in rx attention flag not set.
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
