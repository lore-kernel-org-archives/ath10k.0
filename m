Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMDhE-0003rH-AS
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 11:46:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] dt: bindings: add bindings for ipq4019 wifi block
References: <1452664604-8014-1-git-send-email-rmani@qti.qualcomm.com>
 <20160115022021.GA27099@rob-hp-laptop>
Date: Thu, 21 Jan 2016 13:46:02 +0200
In-Reply-To: <20160115022021.GA27099@rob-hp-laptop> (Rob Herring's message of
 "Thu, 14 Jan 2016 20:20:21 -0600")
Message-ID: <87y4bjyx39.fsf@kamboji.qca.qualcomm.com>
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
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Raja Mani <rmani@qti.qualcomm.com>, agross@codeaurora.org

Rob Herring <robh@kernel.org> writes:

> On Wed, Jan 13, 2016 at 11:26:44AM +0530, Raja Mani wrote:
>> Add device tree binding documentation details for wifi block present
>> in Qualcomm IPQ4019 SoC into "qcom,ath10k.txt".
>> 
>> Right now, ath10k wireless driver has support for PCI based wlan devices.
>> There is a plan to extend ath10k driver to support wifi devices which are
>> connected over AHB as well (enumeration will happen via device tree node).
>> For AHB based devices (ie, ipq4019), all wifi properties are supplied via
>> device tree (including irq, reg addr, cal data,etc).
>> 
>> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
>> ---
>> v3 changes:
>>   - Removed core-id - [Rob]
>>   - Documented which compatible string corresponds to pci devices
>>     and which corresponds to ahb devices. - [Rob]
>> 
>> v2 changes:
>>  - Improved "core-id" description - [Rob]
>>  - Removed "status" documentation - [Rob]
>>  - Added description which properties are applicable
>>    for ahb and which are applicable for pci devices - [Rob]
>>  - Improved commit msg to explain the context.
>>  - Renamed "qca,msi_addr" to "qcom,msi_addr" and
>>    "qca,msi_base" to "qcom,msi_base" to follow uniformity.
>> 
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 89 ++++++++++++++++++++--
>>  1 file changed, 84 insertions(+), 5 deletions(-)
>
> A few typos, otherwise:
>
> Acked-by: Rob Herring <robh@kernel.org>

Rob, thank you for the review. I fixed the typos in ath.git pending
branch and will properly apply this in few days.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
