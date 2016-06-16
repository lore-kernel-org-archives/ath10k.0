Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDZiS-0005Aa-QW
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 16:00:26 +0000
Received: by mail-qk0-x233.google.com with SMTP id a186so57676522qkf.0
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 09:00:03 -0700 (PDT)
Date: Thu, 16 Jun 2016 11:59:59 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: Fix a typo in spectral code commments
Message-ID: <20160616155958.GA24359@localhost>
References: <1465882434-594-1-git-send-email-mohammed@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1465882434-594-1-git-send-email-mohammed@qca.qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Jun 14, 2016 at 11:03:54AM +0530, Mohammed Shafi Shajakhan wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Found this obvious typo while going through the spectral
> code design in ath10k

>  		/* TODO: As experiments with an analogue sender and various
> -		 * configuaritions (fft-sizes of 64/128/256 and 20/40/80 Mhz)
> +		 * configurations (fft-sizes of 64/128/256 and 20/40/80 Mhz)
>  		 * show, the particular configuration of 80 MHz/64 bins does
>  		 * not match with the other smaples at all. Until the reason
>  		 * for that is found, don't report these samples.

Also "smaples" :)

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
