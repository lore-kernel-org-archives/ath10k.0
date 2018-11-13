Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMYq8-0003v9-IB
 for ath10k@lists.infradead.org; Tue, 13 Nov 2018 13:34:50 +0000
Subject: Re: [EXTERNAL] Re: [PATCH] ath10k: Disable 4addr source port learning
 in 10.4 FW by default
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
References: <20181109061121.4184-1-murugana@codeaurora.org>
 <0d74b002-e36d-8169-34e8-59338eac6918@newmedia-net.de>
 <00fd01d4798e$1c0d2f10$54278d30$@codeaurora.org>
 <18df2020-f8c4-b9f7-cf9c-63802ea02429@newmedia-net.de>
 <cc8040a6-47f8-c8f0-0451-2e220d91d62c@newmedia-net.de>
 <4ec664290c20a58f36f2183fc2fd0b4f@codeaurora.org>
 <095fa4b0-883e-192c-e919-0dd0ace026e8@newmedia-net.de>
Message-ID: <cef269dc-b4bc-54a0-5f04-7e4e06bbfe81@newmedia-net.de>
Date: Tue, 13 Nov 2018 14:34:25 +0100
MIME-Version: 1.0
In-Reply-To: <095fa4b0-883e-192c-e919-0dd0ace026e8@newmedia-net.de>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

is it possible to supply a firmware for 99X0 based devices which suffer 
from the same issue? i know the firmware codebase is the same for these 
chipsets and there are alot of embedded
devices around which this older one. unfortunatly this device suffers 
from the same issue

Sebastian

Am 12.11.2018 um 08:33 schrieb Sebastian Gottschall:
> no problem. glad to help you.
>
> Sebastian
>
> Am 12.11.2018 um 06:34 schrieb Sathishkumar Muruganandam:
>> On 2018-11-12 09:40, Sebastian Gottschall wrote:
>>> i tested my proposal now and it fixes the issue. the submitted patch
>>> was simply broken at that small point
>>>
>>
>> You're right. Thanks for your finding !
>>
>> Due to some reason, my patch formatting missed the vdev param
>> assignments to 10.4 and 10.2.4 (unsupported).
>>
>> Sorry for the confusion, let me resend the patch.
>>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
