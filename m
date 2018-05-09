Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGLW7-00013U-PD
 for ath10k@lists.infradead.org; Wed, 09 May 2018 09:36:13 +0000
MIME-Version: 1.0
Date: Wed, 09 May 2018 15:05:57 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH] ath10k: Replace bit shifts with the BIT() macro for rx
 desc bits
In-Reply-To: <20180509074042.GA768@gmail.com>
References: <20180509044804.13751-1-govinds@codeaurora.org>
 <20180509074042.GA768@gmail.com>
Message-ID: <57eb66a936cb541e81cb9ba4f48df61b@codeaurora.org>
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
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-05-09 13:10, Marcus Folkesson wrote:
> Hello Govind,
> 
> On Wed, May 09, 2018 at 10:18:04AM +0530, Govind Singh wrote:
>> Use the BIT() macro from 'linux/bitops.h' to define the rx desc
>> bit flags to have consistency with new definitions.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/rx_desc.h | 134 
>> +++++++++++-----------
>>  1 file changed, 67 insertions(+), 67 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h 
>> b/drivers/net/wireless/ath/ath10k/rx_desc.h
>> index 545deb6d7af1..b3d7c6e7ac90 100644
>> --- a/drivers/net/wireless/ath/ath10k/rx_desc.h
>> +++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
> 
> Looks good, but please include linux/bitops.h as well.
> 
> From the documentation [1]:
> 
> If you use a facility then #include the file that defines/declares
>  that facility.  Don't depend on other header files pulling in ones
>  that you use.
> 

Thanks, addressed the comment in v2 patchset.

> 
> [1] Documentation/process/submit-checklist.rst
> 
> 
> Best regards
> Marcus Folkesson

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
