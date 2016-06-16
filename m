Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDZpQ-0000nz-PT
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 16:07:37 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: Fix a typo in spectral code commments
Date: Thu, 16 Jun 2016 16:06:52 +0000
Message-ID: <eb4c30ff7ff54ea2b63a950acecdd51a@aphydexm01b.ap.qualcomm.com>
References: <1465882434-594-1-git-send-email-mohammed@qca.qualcomm.com>
 <575FC1E5.90108@vitracom.de>
In-Reply-To: <575FC1E5.90108@vitracom.de>
Content-Language: en-US
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
To: Arthur Jagiella <jagiella@vitracom.de>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

+ linux wireless, ath10k

Thanks, initially I could not get what you meant :(

-----Original Message-----
From: Arthur Jagiella [mailto:jagiella@vitracom.de] 
Sent: Tuesday, June 14, 2016 2:06 PM
To: Shajakhan, Mohammed Shafi (Mohammed Shafi) <mohammed@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix a typo in spectral code commments

smaples?



Am 14.06.2016 um 07:33 schrieb Mohammed Shafi Shajakhan:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> Found this obvious typo while going through the spectral code design 
> in ath10k
>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/spectral.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/spectral.c 
> b/drivers/net/wireless/ath/ath10k/spectral.c
> index 4671cfb..4510906 100644
> --- a/drivers/net/wireless/ath/ath10k/spectral.c
> +++ b/drivers/net/wireless/ath/ath10k/spectral.c
> @@ -101,7 +101,7 @@ int ath10k_spectral_process_fft(struct ath10k *ar,
>   		break;
>   	case 80:
>   		/* TODO: As experiments with an analogue sender and various
> -		 * configuaritions (fft-sizes of 64/128/256 and 20/40/80 Mhz)
> +		 * configurations (fft-sizes of 64/128/256 and 20/40/80 Mhz)
>   		 * show, the particular configuration of 80 MHz/64 bins does
>   		 * not match with the other smaples at all. Until the reason
>   		 * for that is found, don't report these samples.

--
Arthur Jagiella
Praktikant
Forschung und Entwicklung
Vitracom AG

Erbprinzenstr. 4-12, A
D-76133 Karlsruhe

Email: jagiella@vitracom.de
Internet: www.vitracom.de



------------------------------------------------
HRB Mannheim 111263
UST-ID: DE 247872702
Vorstand: Axel Stephan,
           Ralph Majer
Aufsichtsrat: Paul A. Stodden (Vors.)
               Christian Eckart, Sacha Grau
------------------------------------------------


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
