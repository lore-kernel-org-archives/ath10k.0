Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPqaI-000257-PE
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 11:22:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: Support different txbf configuration schemes
References: <1438665312-2768-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Thu, 13 Aug 2015 14:21:38 +0300
In-Reply-To: <1438665312-2768-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Tue, 4 Aug 2015 10:45:11 +0530")
Message-ID: <87a8tvo2m5.fsf@kamboji.qca.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vivek Natarajan <nataraja@qti.qualcomm.com> writes:

> qca61x4 uses the vdev param as a sole sufficient configuration
> for txbf while qca99x0 enables txbf during peer assoc by
> combining the vdev param value with peer assoc's vht capabilities
>
> This patch gets the appropriate txbf configuration scheme
> before passing the wmi command to enable the same in the firmware.
>
> Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
