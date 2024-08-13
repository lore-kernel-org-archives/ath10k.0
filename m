Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A6AC52D7C
	for <ath10k@archiver.kernel.org>; Tue, 13 Aug 2024 22:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usai6GDZhtLfh8rMim+JOkJ8cOVXwNu4QF1LRoNJ7R4=; b=3lvM/WcT3fjUg+/8n+wUjHNiRt
	vI/qtMpDr2KcTxn1/Hou1EFR+Z+4tIvOH3twyEmWUUTn+4K/fCDVgid8Sey30mqskyhapvihxWiYk
	0R0VYuBqa6Ob1/nogLAmpWT2aiMI2tD2IhZxaAEKxZuq49MkQFJQ2Gzmqr9Q3ECDv6owbMb167P9G
	8O9LuRms4bbltakwcbznkh+gbD5f+rq2ILX7cjR3DvGcyoxJj9UbJ4gSb3Wkep1eCalXH4GfNG86U
	8xOp5OLufuJJbS60KHM3naqwHRlCBVNKbQu74sK9B6XOevu4uZGCM4pXMpmLaUkW3OGuQR9CSqRn+
	zv8Tmweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdzkD-000000053h9-3naR;
	Tue, 13 Aug 2024 22:11:57 +0000
Received: from mail.kaechele.ca ([54.39.219.105])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdzkA-000000053ga-1ybk
	for ath10k@lists.infradead.org;
	Tue, 13 Aug 2024 22:11:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8089BC005F;
	Tue, 13 Aug 2024 18:12:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1723587153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=usai6GDZhtLfh8rMim+JOkJ8cOVXwNu4QF1LRoNJ7R4=;
	b=X31WAc5Pgn7ooRVy8pBWJ0IqGyZx0255faefKxRB02STw1Sr8VPWEX6v4N6BMq0sbmBOlA
	2qho/rEMCN4T9zwQBkpiflVYW4IU67Xb3bpo6ssBr+JW5qLqo5Zxild3ydI2Xx/x4IPik+
	0WwCtKmJ1JLMCatVXsDP0HfHuojO8RY=
Message-ID: <3f16cd19-7609-4f97-bacd-9ab307bd8533@kaechele.ca>
Date: Tue, 13 Aug 2024 18:11:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: net: bluetooth: qualcomm: add QCA9379
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-mmc@vger.kernel.org
References: <20240805040131.450412-1-felix@kaechele.ca>
 <20240805040131.450412-4-felix@kaechele.ca>
 <645ae5c7-5421-4bf2-9aac-8151b7db4e0b@kernel.org>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <645ae5c7-5421-4bf2-9aac-8151b7db4e0b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_151154_831697_0D5F5515 
X-CRM114-Status: GOOD (  16.17  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Thanks for taking a look, Krzysztof.

In this case I think it would be easiest to just use the existing 
qca9377 fallback and drop his part of the patchset.

As for the supplies: For the particular module I am working with the 
supplies are mostly shared with the WiFi side. So it "just works" 
without taking care of supplies on the BT side.

But I agree it would be more correct to add and handle these as well. 
The documentation I have access to through the FCC filing of this module 
is not really conclusive of how to correctly name them in this context.
I would rather avoid submitting a patch with incorrect supply names.

Thanks again,
Felix

On 2024-08-05 01:31, Krzysztof Kozlowski wrote:
> On 05/08/2024 06:01, Felix Kaechele wrote:
>> Document that the QCA9379, as a member of the QCA6174 family, is
>> supported by the existing driver.
>>
>> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
>> ---
>>   .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 68c5ed111417..f968b0d236e0 100644
>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> @@ -19,6 +19,7 @@ properties:
>>         - qcom,qca2066-bt
>>         - qcom,qca6174-bt
>>         - qcom,qca9377-bt
>> +      - qcom,qca9379-bt
> 
> Then use fallback of 9377 or any other device. I still wonder why you do
> not require any supplies.
> 
> Best regards,
> Krzysztof
> 
> 

