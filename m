Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-f180.google.com ([209.85.128.180])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnlTY-0007ge-FR
 for ath10k@lists.infradead.org; Fri, 01 Sep 2017 12:55:10 +0000
Received: by mail-wr0-f180.google.com with SMTP id z91so403843wrc.1
 for <ath10k@lists.infradead.org>; Fri, 01 Sep 2017 05:54:47 -0700 (PDT)
Subject: Re: ath10k frequently disconnects with firmware-6.bin
References: <32171fa5-5785-f844-ca76-e2536e66ce68@suse.cz>
 <f5f1e657-7213-d3a3-7b80-db4060e38d4b@qti.qualcomm.com>
 <87r2vrr4qg.fsf@kamboji.qca.qualcomm.com>
From: Jiri Slaby <jslaby@suse.cz>
Message-ID: <a4f1dac5-6cf6-18f7-6bf0-ee25b50bbd61@suse.cz>
Date: Fri, 1 Sep 2017 14:54:44 +0200
MIME-Version: 1.0
In-Reply-To: <87r2vrr4qg.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-GB
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: Michal Hlavac <miso@hlavki.eu>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 08/31/2017, 08:07 PM, Kalle Valo wrote:
> Ryan Hsu <ryanhsu@qti.qualcomm.com> writes:
> 
>> On 08/22/2017 02:11 AM, Jiri Slaby wrote:
>>
>>> Hi,
>>>
>>> are you aware of this issue:
>>> https://bbs.archlinux.org/viewtopic.php?pid=1728715#p1728715
>>> ?
>>>
>>> If the guys use an older firmware, everything works.
>>>
>>> Is there any FW or code fix available somewhere?
>>
>> Can you give it a try with Rm4.4.1 firmware?
>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1
>>
>> http://lists.infradead.org/pipermail/ath10k/2017-August/010055.html
> 
> Jiri, did it help? I'll try to update RM4.4.1 to linux-firmware as soon
> as I can but it would be good to get confirmation that RM4.4.1 has
> solved the regression.

Hi, I never got a reply from Michal (CCed).

-- 
js
suse labs

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
