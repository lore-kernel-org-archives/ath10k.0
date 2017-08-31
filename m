Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnTsm-00014P-Tq
 for ath10k@lists.infradead.org; Thu, 31 Aug 2017 18:08:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k frequently disconnects with firmware-6.bin
Date: Thu, 31 Aug 2017 18:07:04 +0000
Message-ID: <87r2vrr4qg.fsf@kamboji.qca.qualcomm.com>
References: <32171fa5-5785-f844-ca76-e2536e66ce68@suse.cz>
 <f5f1e657-7213-d3a3-7b80-db4060e38d4b@qti.qualcomm.com>
In-Reply-To: <f5f1e657-7213-d3a3-7b80-db4060e38d4b@qti.qualcomm.com> (Ryan
 Hsu's message of "Wed, 23 Aug 2017 02:19:38 +0000")
Content-Language: en-US
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: Jiri Slaby <jslaby@suse.cz>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ryan Hsu <ryanhsu@qti.qualcomm.com> writes:

> On 08/22/2017 02:11 AM, Jiri Slaby wrote:
>
>> Hi,
>>
>> are you aware of this issue:
>> https://bbs.archlinux.org/viewtopic.php?pid=1728715#p1728715
>> ?
>>
>> If the guys use an older firmware, everything works.
>>
>> Is there any FW or code fix available somewhere?
>
> Can you give it a try with Rm4.4.1 firmware?
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1
>
> http://lists.infradead.org/pipermail/ath10k/2017-August/010055.html

Jiri, did it help? I'll try to update RM4.4.1 to linux-firmware as soon
as I can but it would be good to get confirmation that RM4.4.1 has
solved the regression.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
