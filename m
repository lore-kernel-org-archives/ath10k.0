Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKbzH-0005s3-RA
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 04:32:13 +0000
MIME-Version: 1.0
Date: Thu, 08 Nov 2018 10:01:51 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
In-Reply-To: <7f2ef494f4a2aba1845a157da8fec449@codeaurora.org>
References: <20181107185643.240346-1-briannorris@chromium.org>
 <7f2ef494f4a2aba1845a157da8fec449@codeaurora.org>
Message-ID: <b1a64bd66fa25f274af8c018c6fc02f4@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Yu Wang <yyuwang@codeaurora.org>, linux-wireless-owner@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Rakesh Pillai <pillair@codeaurora.org>, stable@vger.kernel.org

On 2018-11-08 03:00, Rajkumar Manoharan wrote:
> On 2018-11-07 10:56, Brian Norris wrote:
>> This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.
>> 
>> WCN3990 firmware does not yet implement this feature, and so it 
>> crashes
>> like this:
>> 
>>   fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN 
>> RT:207a:PC=b001b4f0
>> 
>> This feature can be re-implemented with a proper service bitmap or 
>> other
>> feature-discovery mechanism in the future. But it should not break
>> working boards.
>> 
> Brian,
> 
> The change "ath10k: add quiet mode support for QCA6174/QCA9377" was 
> merged even
> before full WCN3990 device support was added in ath10k. How come it
> could be regression
> for WCN3990. I know both are sharing same WMI-TLV interface but 
> reverting this
> will break QCA6174/QCA9377. no?
> 

This regression is found while we switched from 4.18 + WCN3990 
back-ports to 4.19.

> I would prefer to handle this within WMI callback or upper layer.
> 

IMO, we should use (WMI_SERVICE_THERMAL_MGMT | WMI_SERVICE_THERM_THROT ) 
service bitmap check and call
ath10k_thermal_set_throttling only if fw supports THERMAL THROTTLE 
feature. But we need to ensure all
available ath10k fw's are reporting this service.

> -Rajkumar

BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
