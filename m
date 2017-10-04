Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzfTQ-0005wn-IR
 for ath10k@lists.infradead.org; Wed, 04 Oct 2017 08:56:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 01/11] ath10k_sdio: sdio htt data transfer fixes
Date: Wed, 4 Oct 2017 08:55:47 +0000
Message-ID: <878tgrxpf1.fsf@kamboji.qca.qualcomm.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-2-git-send-email-alagusankar@silex-india.com>
 <59D1EC94.2020307@broadcom.com>
In-Reply-To: <59D1EC94.2020307@broadcom.com> (Arend van Spriel's message of
 "Mon, 2 Oct 2017 09:36:52 +0200")
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
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: "silexcommon@gmail.com" <silexcommon@gmail.com>, Alagu Sankar <alagusankar@silex-india.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Arend van Spriel <arend.vanspriel@broadcom.com> writes:

> On 9/30/2017 7:37 PM, silexcommon@gmail.com wrote:
>> From: Alagu Sankar <alagusankar@silex-india.com>
>>
>
> [...]
>
>>
>> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
>
> Not really have a specific remark for this patch, but for the entire
> series. These patches are sent using an anonymous email address, apart
> from 'silex' being in there, which does not show up in the certificate
> of origin. Just wondering if this is acceptable?

As long as there's the "correct" From header as the first line in the
commit log, which git then uses as the author instead of the From line
from email header. And I see Alagu doing that here so there shouldn't be
any problems.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
