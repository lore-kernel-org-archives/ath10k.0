Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMDxc-0000aq-Ph
 for ath10k@lists.infradead.org; Fri, 25 May 2018 14:44:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v1] ath10k: fix band_center_freq handling for VHT160 in
 recent firmwares
References: <20180426094357.24358-1-s.gottschall@dd-wrt.com>
 <19b8766e-d474-31d3-ff38-993498ee670d@candelatech.com>
 <da5c7c56-9a41-99f0-28be-3a2c8e9fabbf@dd-wrt.com>
Date: Fri, 25 May 2018 17:44:34 +0300
In-Reply-To: <da5c7c56-9a41-99f0-28be-3a2c8e9fabbf@dd-wrt.com> (Sebastian
 Gottschall's message of "Thu, 26 Apr 2018 17:12:11 +0200")
Message-ID: <87wovr94ml.fsf@kamboji.qca.qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 26.04.2018 um 15:44 schrieb Ben Greear:
>>
>>
>> On 04/26/2018 02:43 AM, s.gottschall@dd-wrt.com wrote:
>>> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>>>
>>> starting with firmware 10.4.3.4.x series QCA changed the handling
>>> of the channel property band_center_freq1 and band_center_freq2 in
>>> vht160 operation mode
>>> likelly for backward compatiblity with vht80 only capable clients.
>>> this patch adjusts the handling to get vht160 to work again with
>>> official qca firmwares newer than 3.3
>>> consider that this patch will not work with older firmwares
>>> anymore. to avoid undefined behaviour this we disable vht160
>>> capability for outdated firmwares
>>
>> We should be able to use a feature-flag or otherwise determine if
>> the firmware needs the old or new
>> API and make the driver able to handle both.
>
> the new firmware must be used as is and it works. the old firmware can
> be detected on the missing vht cap flag.
> but thats not my task. i can only use feature flags if they are
> included within the qca firmwares. but they arent
> the old pre 3.3 firmwares should be treated as obsolete. they are more
> than 2 years old and do not announce vht160 capability
> even if it works with some ignorance, but on the other side the it has
> backward incompatiblies with older vht80 only clients.
> this is why the new way was introduced

I was told ath10k could check for WMI_SERVICE_EXTENDED_NSS_SUPPORT flag.
Can someone test and verify that?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
