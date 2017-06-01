Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGPhj-0003HK-Ut
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 12:59:57 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Add BMI parameters to fix calibration from DT/pre-cal
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1495709483-29793-1-git-send-email-akolli@qti.qualcomm.com>
References: <1495709483-29793-1-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <71eb9446428744b58d1571a19d4fb845@eusanexr01a.eu.qualcomm.com>
Date: Thu, 1 Jun 2017 05:59:31 -0700
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@qti.qualcomm.com wrote:

> QCA99X0, QCA9888, QCA9984 supports calibration data in
> either OTP or DT/pre-cal file. Current ath10k supports
> Calibration data from OTP only.
> 
> If caldata is loaded from DT/pre-cal file, fetching board id
> and applying calibration parameters like tx power gets failed.
> 
> error log:
> [   15.733663] ath10k_pci 0000:01:00.0: failed to fetch board file: -2
> [   15.741474] ath10k_pci 0000:01:00.0: could not probe fw (-2)
> 
> This patch adds calibration data support from DT/pre-cal
> file.  Below parameters are used to get board id and
> applying calibration parameters from cal data.
> 
> 		EEPROM[OTP]	FLASH[DT/pre-cal file]
> Cal param	0x700		0x10000
> Board id	0x10		0x8000
> 
> Tested on QCA9888 with pre-cal file.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a9f5f287fa1d ath10k: add BMI parameters to fix calibration from DT/pre-cal

-- 
https://patchwork.kernel.org/patch/9748097/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
