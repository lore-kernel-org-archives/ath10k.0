Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from up.icubehost.com ([185.62.36.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyvP7-0001Pt-V8
 for ath10k@lists.infradead.org; Mon, 02 Oct 2017 07:44:43 +0000
MIME-Version: 1.0
Date: Mon, 02 Oct 2017 13:14:18 +0530
From: Alagu Sankar <alagusankar@silex-india.com>
Subject: Re: [PATCH 01/11] ath10k_sdio: sdio htt data transfer fixes
In-Reply-To: <59D1EC94.2020307@broadcom.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-2-git-send-email-alagusankar@silex-india.com>
 <59D1EC94.2020307@broadcom.com>
Message-ID: <f4255671cb5e7b52f823e26ba6816d2f@silex-india.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: silexcommon@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Arend,

On 2017-10-02 13:06, Arend van Spriel wrote:
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
> 
> Regards,
> Arend
> 
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c   | 20 +++++++++++++++++---
>>   drivers/net/wireless/ath/ath10k/htt_rx.c |  6 ++++--
>>   drivers/net/wireless/ath/ath10k/htt_tx.c | 24 
>> +++++++++++++++++++-----
>>   3 files changed, 40 insertions(+), 10 deletions(-)
> 
Could not use git send-email from the official ID due to mail server 
restrictions. If this is not acceptable, I will figure out a way to 
overcome this.

Regards,
Alagu Sankar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
