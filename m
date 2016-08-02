Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYfn-000562-F5
 for ath10k@lists.infradead.org; Tue, 02 Aug 2016 12:19:58 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k fail to load firmware
Date: Tue, 2 Aug 2016 12:19:19 +0000
Message-ID: <87a8gv748q.fsf@kamboji.qca.qualcomm.com>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <20160719072754.GB2751@redhat.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F0C8@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQn4T+4zMrJEbLBfu92w=mVqWBZZkZaYaW__V2_-VLkCyQ@mail.gmail.com>
In-Reply-To: <CA+BoTQn4T+4zMrJEbLBfu92w=mVqWBZZkZaYaW__V2_-VLkCyQ@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 19 Jul 2016 10:32:59 +0200")
Content-Language: en-US
Content-ID: <43D2CC143FEA554D8BA26BC02D68A834@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, "Perry_Yuan@dell.com" <Perry_Yuan@dell.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 19 July 2016 at 10:24,  <Perry_Yuan@dell.com> wrote:
>> Dell - Internal Use - Confidential
>>
>> HI  All:
>> I have replaced the new firmware files to old one. And I build new ath10k_pci.ko ,ath10k_core.ko to get some
>> debug info.
>>
>> The new firmware is still not loaded by ath10k driver .
>> And I compare the driver codes with 4.7 -rc7 , the codes are almost same.
>> So the issue should be in  firmware scope.
>>
>> [ 590.486970] ath10k_pci 0000:02:00.0: Hardware name qca6174 hw3.2 version 0x5030000
>> [  590.487158] ath10k_pci 0000:02:00.0: Direct firmware load failed with error -2
>> [  590.487159] ath10k_pci 0000:02:00.0: Falling back to user helper
>
> You didn't attach a complete log so it's hard to tell. ath10k tends to
> print a few messages that may look like an error but aren't (there's a
> fallback mechanism for finding firmware files which is overly
> verbose).
>
> @Perry: You need to rename the
> firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1 to firmware-4.bin in case
> you merely mirrored the github repo.
>
> @Kalle: I think it'd be very useful to maintain ath10k-firmware in a
> way so that it is easier to the uninitiated to `git clone` it into
> /lib/firmware, e.g. maintain firmware-X.bin symlinks in each
> QCAxxx/hw.y/ to the latest one. Thoughts?

Yeah, something like that would be really nice. It would also make it
easier for me to update linux-firmware.git.

What about if we had a script which installs the latest ath10k firmware
files from ath10k-firmware.git? Something along lines of:

$ cd ~/git/ath10k-firmware
$ git pull
$ sudo ath10k-fw-install /lib/firmware/ath10k

I could also add a simple menu to select older firmware versions. But
this is just a wild idea.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
