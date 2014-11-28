Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuIGk-0000Fs-W5
 for ath10k@lists.infradead.org; Fri, 28 Nov 2014 09:55:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
 <20141127120856.17546.32014.stgit@potku.adurom.net>
 <3202372.2AaH3c4qv1@wuerfel>
Date: Fri, 28 Nov 2014 11:54:39 +0200
In-Reply-To: <3202372.2AaH3c4qv1@wuerfel> (Arnd Bergmann's message of "Thu, 27
 Nov 2014 13:28:45 +0100")
Message-ID: <87fvd3sl9c.fsf@kamboji.qca.qualcomm.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, toshik@chromium.org, ath10k@lists.infradead.org

Arnd Bergmann <arnd@arndb.de> writes:

> On Thursday 27 November 2014 14:08:56 Kalle Valo wrote:
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> new file mode 100644
>> index 000000000000..edefc26c6204
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -0,0 +1,30 @@
>> +* Qualcomm Atheros ath10k wireless devices
>> +
>> +For ath10k devices the calibration data can be provided through Device
>> +Tree. The node is a child node of the PCI controller.
>> +
>> +Required properties:
>> +-compatible : Should be "qcom,ath10k"
>> +
>> +Optional properties:
>> +- qcom,ath10k-calibration-data : calibration data as an array, the
>> +                                length can vary between hw versions
>> +
>
> Does the device always have a valid mac address in hardware? If not,
> how about listing that as well using the mac-address property?

Right now ath10k does not support that, but in the future we might want
to add mac address as well. We need to do some testing with the firmware
to make sure that we can safely change the "main" address from ath10k.

And because of Virtual AP (mBSSID) feature we actually would need to
provide multiple addresses, not just one. Maybe with addr_mask like
struct wiphy has?

 * @perm_addr: permanent MAC address of this device
 * @addr_mask: If the device supports multiple MAC addresses by masking,
 *	set this to a mask with variable bits set to 1, e.g. if the last
 *	four bits are variable then set it to 00-00-00-00-00-0f. The actual
 *	variable bits shall be determined by the interfaces added, with
 *	interfaces not matching the mask being rejected to be brought up.

	/* permanent MAC address(es) */
	u8 perm_addr[ETH_ALEN];
	u8 addr_mask[ETH_ALEN];

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
