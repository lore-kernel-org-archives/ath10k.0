Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Zfz-0001ea-PI
 for ath10k@lists.infradead.org; Wed, 20 Mar 2019 11:46:33 +0000
MIME-Version: 1.0
Date: Wed, 20 Mar 2019 17:16:29 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v2 0/2] Add xo calibration support for wifi rf clock
In-Reply-To: <2614783.8fX38OIfA2@bentobox>
References: <20190320044511.12172-1-govinds@codeaurora.org>
 <2614783.8fX38OIfA2@bentobox>
Message-ID: <010c3a8c56a85fb5d3c8194594f5b9c2@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Catrinel Catrinescu <cc@80211.de>, srichara@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

Hi Sven,

On 2019-03-20 14:07, Sven Eckelmann wrote:
> On Wednesday, 20 March 2019 05:45:09 CET Govind Singh wrote:
>> PMIC XO is the clock source for wifi rf clock in integrated wifi
>> chipset ex: WCN3990. Due to board layout errors XO frequency drifts
>> can cause wifi rf clock inaccuracy.
>> XO calibration test tree in Factory Test Mode is used to find the
>> best frequency offset(for example +/-2KHz )by programming XO trim
>> register. This ensure system clock stays within required 20 ppm
>> WLAN rf clock.
>> 
>> Retrieve the xo trim offset via system firmware (e.g., device tree),
>> especially in the case where the device doesn't have a useful EEPROM
>> on which to store the calibrated XO offset (e.g., for integrated 
>> Wifi).
>> Calibrated XO offset is sent to fw, which compensate the clock drift
>> by programing the XO trim register.
> 
> Who is responsible to fill in this values in the device-tree?

This is populated via boot-loader/system fw(for chrome-OS its coreboot).
Post calibration QDART writes to non-volatile/persist region and
during boot up boot loader fills this value in dt node as there is
no otp region or EPROM available.

> On other
> products, the correct XTAL capacitor registers values are calibrated on
> different devices (in the same product line) separately to ensure that 
> each
> device has a minimal inaccuracy. During the boot of the device, the two 
> u8
> taken from params_for_tuning_caps (inside the EEPROM) are just written 
> to the
> AR_CH0_XTAL register (mapped to the correct the INDAC and OUTDAC 
> region).
> 
> Your patch here seems to be doing something similar (you may correct me 
> if I
> misinterpret something) but you are already saying that these devices 
> don't
> have an EEPROM. This is already quite odd because then we also wouldn't 
> have
> temperature compensation (also stored in per device EEPROM/precal data 
> for
> other devices).
> 
> So you move it to the device tree. By default, this device tree is most 
> likely
> a static thing which is shipped with the rest of the firmware. So no 
> per
> device data is stored in this DTB on the flash. To include device 
> specific
> information (mac addresses, calibration data, ...), you could also have 
> the
> bootloader (u-boot for example) change the device tree during the boot 
> process
> and let it inject the device specific XO trim register data.
> 
> How is this planned to work? Is the bootloader expected to modify the 
> device
> tree during the boot to provide the device specific xo-cal-data. If 
> yes, where
> is it getting the information from? And is there already support for 
> QDART for
> it?
> 
Per device data will be stored in NOR flash by QDART and dt entry will 
be populated during boot by bootloader.
Here we are trying to set the xo trim register of PMIC xtal, which is 
the base clk source of wifi rf clk.

> If you do this, why aren't you using the data from qcom,ath10k-pre-
> calibration-data. At least for other ath10k devices, it includes the
> previously mentioned tuning caps. It is the first time I heard about an 
> XO
> trim register and thus it might be something different than what I 
> expect.
> 
No, Integrated chip set ex:WCN3990 does not use 
ath10k-pre-calibration-data.

> 
> Last question: why is it an u32 when the message with xo_cal_data can 
> only
> transport an u8?
> 

Yes, this i will fix in next version.

> Kind regards,
> 	Sven

BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
