Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9qjQ-0005cx-Tx
 for ath10k@lists.infradead.org; Wed, 01 Nov 2017 10:58:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath: Incorrect regDomainPairs/allCountries settings
Date: Wed, 1 Nov 2017 10:58:22 +0000
Message-ID: <87k1zaxo36.fsf@kamboji.qca.qualcomm.com>
References: <1693831.JqVThioVz9@bentobox>
In-Reply-To: <1693831.JqVThioVz9@bentobox> (Sven Eckelmann's message of "Tue, 
 08 Aug 2017 11:45:38 +0200")
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Luis R.
 Rodriguez" <mcgrof@do-not-panic.com>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> I just had two inquiries from Vietnam and Singapore regarding the used CTL 
> limits by Atheros based chips. I've checked through the code and noticed that 
> regd_common.h assigns SG to APL6_WORLD and VN to NULL1_WORLD.
>
>  * SG: APL6_WORLD
>    - 2.4GHz: CTL_ETSI
>    -   5GHz: CTL_ETSI
>  * VN: NULL1_WORLD
>    - 2.4GHz: CTL_ETSI
>    -   5GHz: NO_CTL
>
> But I personally would have expected that both countries would be assigned to 
> FCC3_WORLD.
>
>  * FCC3_WORLD
>    - 2.4GHz: CTL_ETSI
>    -   5GHz: CTL_FCC
>
> Maybe someone from QCA can check with their internal driver.

I asked around and got this answer:

"Correct, internal code base assigns SG and VN to FCC3_WORLD regdomain,
CTL limits are assigned accordingly as he mentioned."

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
