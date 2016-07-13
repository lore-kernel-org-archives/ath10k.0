Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNTKs-0000Xb-7z
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 23:12:59 +0000
References: <578673DA.1010907@candelatech.com>
 <1468430769350.75672@qti.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <6b019cbc-e909-540e-95d1-b14f2be0128d@dd-wrt.com>
Date: Thu, 14 Jul 2016 01:12:24 +0200
MIME-Version: 1.0
In-Reply-To: <1468430769350.75672@qti.qualcomm.com>
Subject: Re: Anyone brought up 9984 NIC on x86-64?
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Am 13.07.2016 um 19:26 schrieb Manoharan, Rajkumar:
>> I added a few patches to my 4.7 kernel to enable ath10k to load for 9984,
>> but it immediately crashes due to IOMMU error when trying to allocate
>> memory.
>>
>> I'm building the latest linux-ath tree now and will test that when it
>> is done, but I am curious to know if anyone has successfully booted
>> 9984 on x86-64?
>>
> Ben,
>
> Are you seeing IOMMU error even after wtih your DMA_BIDIRECTIONAL change?=
 Could you please try with
>
> https://patchwork.kernel.org/patch/9175029/
>
> But increase WMI_MAX_MEM_CHUNK_SIZE to 512.
while debugging i found out that it will allocate up to 800 kb here on =

99xx chipsets. truncating  this value in any way will definitly cause =

out of bound access conditions.
so i assume the code is wrong. the firmware requests the size, so it =

should get it. otherwise unexpected behaviour is guaranteed

Sebastian
>
> -Rajkumar
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
