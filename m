Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXmYa-0007BI-Nd
 for ath10k@lists.infradead.org; Mon, 22 Feb 2016 09:13:29 +0000
Received: by mail-wm0-x22e.google.com with SMTP id g62so153649171wme.0
 for <ath10k@lists.infradead.org>; Mon, 22 Feb 2016 01:13:08 -0800 (PST)
Subject: Re: ath10k and QCA3977 - random transfer rate losses
References: <20160214214016.GA27902@localhost.fritz.box>
 <22d26207d398427b9ea847881e6a3a1f@NALASEXR01G.na.qualcomm.com>
 <20160219091602.GA7702@localhost.fritz.box>
 <CAJ-VmomFHCiiK+OQfafcSJFda7c=WU+bbgK7fpm7GT37LS1YKw@mail.gmail.com>
 <20160219172300.GA9252@localhost.fritz.box>
 <a65854576afe4e5c84ec772f7202f709@NALASEXR01G.na.qualcomm.com>
 <20160221144419.GA9138@localhost.fritz.box>
 <CAJ-VmokgsUui600Gbz_3JBDS2Ko3FReSNM8ehhfhfA7QtGqUbA@mail.gmail.com>
 <20160221192014.GA23774@localhost.fritz.box>
 <CAJ-VmokTGS50CnxWgQ2U4=miC+agQQMY=y96hTbSn19xAGTOSQ@mail.gmail.com>
 <20160221215435.GA12664@localhost.fritz.box>
From: vagner_ <vagnerrener@gmail.com>
Message-ID: <56CAD117.3030003@gmail.com>
Date: Mon, 22 Feb 2016 11:12:55 +0200
MIME-Version: 1.0
In-Reply-To: <20160221215435.GA12664@localhost.fritz.box>
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
To: Tobias Predel <tobias.predel@gmail.com>, Adrian Chadd <adrian@freebsd.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Hsu,
 Ryan" <ryanhsu@qca.qualcomm.com>

Hi Tobias,

Do you think that aplying the right board.bin makes the Bluetooth work 
properly?
My wireless card

Network controller: Qualcomm Atheros Device 0042 (rev 30)

Has got bluethooth capabilities, but does not work. On boot time it 
complains about a file called ranpatch (...).bin related to it  :(

++++++++++++++++++++++++++++++++++++++++++

On 02/21/2016 11:54 PM, Tobias Predel wrote:
> Hello Adrian,
>
> bug report can be found here <https://bugzilla.kernel.org/show_bug.cgi?id=112451#c10>
> I added other firmware files. I don't know any other place.
>
> Tobias
>
> On Sun, Feb 21, 2016 at 11:25:52AM -0800, Adrian Chadd wrote:
>> ok, well, we should file a bug report so this isn't forgotten.
>>
>> Where's the right place to create bug reports? is there an ath10k
>> staging branch in github somewhere? or bugzilla.kernel.org ?
>>
>>
>> -a
>>
>>
>> On 21 February 2016 at 11:20, Tobias Predel <tobias.predel@gmail.com> wrote:
>>> Yes. I confirm full functionality now.
>>>
>>> On Sun, Feb 21, 2016 at 10:33:26AM -0800, Adrian Chadd wrote:
>>>> Right, so just to be clear - it's just the board file updates that
>>>> make it all work fine?
>>>>
>>>>
>>>> -a
>>>>
>>>>
>>>> On 21 February 2016 at 06:44, Tobias Predel <tobias.predel@gmail.com> wrote:
>>>>> Hello again,
>>>>>
>>>>> one last word about the the board files:
>>>>>
>>>>> I extracted the board files from an AsusTek Windows Driver installer
>>>>> that included the Qualcomm driver files for diverse variants of QCA9377
>>>>> built in Samsung, Asus (Askey), Acer, Lenovo notebooks.
>>>>>
>>>>> An archive with all these files can be found at the comment 10 of my bug report
>>>>> <https://bugzilla.kernel.org/show_bug.cgi?id=112451#c10>
>>>>> including board files (eeprom_*.bin) for NFA425, NFA435 (A), NFA455.
>>>>>
>>>>> If some people experience trouble, those might look at the netathr10x.inf
>>>>> to find out which eeprom board file is needed or try out by installing
>>>>> it to /lib/firmware/ath10k/QCA9377/hw1.0/board.bin.
>>>>>
>>>>> Those board files are using api 1 and must be named board.bin.
>>>>> firmware-5.bin is still to be pulled from kvalo's github repo.
>>>>>
>>>>> Thank you to all for your support. I wish the best!
>>>>>
>>>>> Tobias
>>>>>
>>>>>
>>>>> On Fri, Feb 19, 2016 at 05:55:26PM +0000, Hsu, Ryan wrote:
>>>>>> Glad that help!
>>>>>>
>>>>>> I've cc that file to Kalle, hope we can see that get merged soon.
>>>>>>
>>>>>> Ryan
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Tobias Predel [mailto:tobias.predel@gmail.com]
>>>>>>> Sent: Friday, February 19, 2016 09:23 AM
>>>>>>> To: Adrian Chadd
>>>>>>> Cc: Hsu, Ryan; ath10k@lists.infradead.org; vagner_
>>>>>>> Subject: Re: ath10k and QCA3977 - random transfer rate losses
>>>>>>>
>>>>>>> On Fri, Feb 19, 2016 at 08:07:49AM -0800, Adrian Chadd wrote:
>>>>>>>> Ok, so it's a board file problem? this can be solved by telling kvalo@
>>>>>>>> about it, right?
>>>>>>>>
>>>>>>>>
>>>>>>>> -a
>>>>>>> Yes, they differ and the board-2.bin file isn't included neither in linux-
>>>>>>> firmware nor in kvalo's repository.
>>>>>>>
>>>>>>> MD5 checksums:
>>>>>>> 73cca12b9398f0cecaa3cfa35c8961b7  board-2.bin
>>>>>>> 44349f6ae93cf9ceffb164f58d4fb124  board.bin
>>>>>>>
>>>>>>> I'll try to contact him and send the board file.
>>>>>>>
>>>>>>> Tobias


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
