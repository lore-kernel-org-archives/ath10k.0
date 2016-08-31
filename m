Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezoV-0007w0-Qs
 for ath10k@lists.infradead.org; Wed, 31 Aug 2016 07:20:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv3,
 1/3] ath10k: move firmware_swap_code_seg_info to ath10k_fw_file
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1467356767-31646-1-git-send-email-c_traja@qti.qualcomm.com>
Message-ID: <4b5f565d8e124aca9debc00ee47efb2e@euamsexm01a.eu.qualcomm.com>
Date: Wed, 31 Aug 2016 09:19:31 +0200
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
To: c_traja@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, tamizhchelvam@codeaurora.org, ath10k@lists.infradead.org

c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> Preparation to make use of firmware_swap_code_seg_info for UTF binary.
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

Thanks, 3 patches applied to ath-next branch of ath.git:

5459c5d47608 ath10k: move firmware_swap_code_seg_info to ath10k_fw_file
d912fc094bc4 ath10k: handle testmode events for 10.2 and 10.4 based firmware
ebce1a5e3a0e ath10k: add testmode support for 10.4 firmware

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9209331/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
