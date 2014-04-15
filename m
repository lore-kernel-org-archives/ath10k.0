Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZsiR-0000nn-4Q
 for ath10k@lists.infradead.org; Tue, 15 Apr 2014 02:03:15 +0000
Message-ID: <534C934B.1@candelatech.com>
Date: Mon, 14 Apr 2014 19:02:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Modified ath10k firmware is now available for non-commercial use.
References: <534C38AE.3070504@candelatech.com>
 <CAEFj986VEybhQbG4OQptLMGakTD1fOTbbz9H+-TJKPef7ehG9g@mail.gmail.com>
In-Reply-To: <CAEFj986VEybhQbG4OQptLMGakTD1fOTbbz9H+-TJKPef7ehG9g@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 04/14/2014 06:38 PM, Yeoh Chun-Yeow wrote:
> On Tue, Apr 15, 2014 at 3:36 AM, Ben Greear <greearb@candelatech.com> wrote:
>> Our modified ath10k firmware binary is now available for download.  It may only be used
>> for non-commercial purposes unless you get a commercial license from my company.
>>
>> The main thing this firmware supports that upstream firmware does not
>> is lots of virtual stations connected to the same AP.
> Is this firmware mainly for STA mode or AP mode or both?

It should work for both.  Most testing has been in STA mode.  It is based on
top of the .467 (AP) firmware...

>> We have some
>> additional stability fixes we found in testing, and probably have introduced
>> some bugs as well.  We will be putting ongoing effort into improving
>> this firmware.
>>
>> We also have the ability to decode firmware stack dumps (found in
>> dmesg and/or /var/log/messages) if they come from our firmware.
>> We cannot share the details of the decode nor tools to decode it,
>> but we will try to fix the problems and/or describe the results of
>> our decode in general terms.
>>
>> The firmware should work with stock 3.14 or other recent kernels,
>> but we have done most testing using our own modified 3.14 kernel.
>> Our kernel patches are required to support the additional stations,
>> software-crypt, and other features specific to our firmware.
>>
> Raw Tx mode without the firmware stripping off the QoS control field
> is supported?

No, probably not, but you can disable hwcrypt for RX pkts, at least.

Might could add the raw tx mode some day, but I've higher
priority tasks first....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
