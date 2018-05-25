Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fME5K-0006RS-2h
 for ath10k@lists.infradead.org; Fri, 25 May 2018 14:53:24 +0000
Subject: Re: [PATCH v1] ath10k: fix band_center_freq handling for VHT160 in
 recent firmwares
References: <20180426094357.24358-1-s.gottschall@dd-wrt.com>
 <19b8766e-d474-31d3-ff38-993498ee670d@candelatech.com>
 <da5c7c56-9a41-99f0-28be-3a2c8e9fabbf@dd-wrt.com>
 <87wovr94ml.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <71d17554-7727-cdfa-4a0d-5e1170dc32b7@candelatech.com>
Date: Fri, 25 May 2018 07:52:32 -0700
MIME-Version: 1.0
In-Reply-To: <87wovr94ml.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 05/25/2018 07:44 AM, Kalle Valo wrote:
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> Am 26.04.2018 um 15:44 schrieb Ben Greear:
>>>
>>>
>>> On 04/26/2018 02:43 AM, s.gottschall@dd-wrt.com wrote:
>>>> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>>>>
>>>> starting with firmware 10.4.3.4.x series QCA changed the handling
>>>> of the channel property band_center_freq1 and band_center_freq2 in
>>>> vht160 operation mode
>>>> likelly for backward compatiblity with vht80 only capable clients.
>>>> this patch adjusts the handling to get vht160 to work again with
>>>> official qca firmwares newer than 3.3
>>>> consider that this patch will not work with older firmwares
>>>> anymore. to avoid undefined behaviour this we disable vht160
>>>> capability for outdated firmwares
>>>
>>> We should be able to use a feature-flag or otherwise determine if
>>> the firmware needs the old or new
>>> API and make the driver able to handle both.
>>
>> the new firmware must be used as is and it works. the old firmware can
>> be detected on the missing vht cap flag.
>> but thats not my task. i can only use feature flags if they are
>> included within the qca firmwares. but they arent
>> the old pre 3.3 firmwares should be treated as obsolete. they are more
>> than 2 years old and do not announce vht160 capability
>> even if it works with some ignorance, but on the other side the it has
>> backward incompatiblies with older vht80 only clients.
>> this is why the new way was introduced
>
> I was told ath10k could check for WMI_SERVICE_EXTENDED_NSS_SUPPORT flag.
> Can someone test and verify that?
>

I do see that my firmware source based on older upstream QCA FW does not advertise
that flag, and newer QCA firmware does, so it would appear that test might
work.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
