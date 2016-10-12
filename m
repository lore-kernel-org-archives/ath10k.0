Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buKHK-0007e1-W1
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 14:13:10 +0000
References: <CA+i30h8YsG7mce5FMwGw2fRNAn3USYV6K==QMjMQVeSGB0dj=w@mail.gmail.com>
 <8760oxfzg4.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <040abb8b-d57b-63f9-43ec-da7e12b87bc6@dd-wrt.com>
Date: Wed, 12 Oct 2016 16:12:39 +0200
MIME-Version: 1.0
In-Reply-To: <8760oxfzg4.fsf@kamboji.qca.qualcomm.com>
Subject: Re: QCA9887 Firmware Memory Usage
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, David Hutchison <dhutchison@bluemesh.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Am 12.10.2016 um 15:51 schrieb Valo, Kalle:
> David Hutchison <dhutchison@bluemesh.net> writes:
>
>> I am using a Mikrotik hAP AC Lite which has a QCA9887 radio. It
>> appears to be working; however ath10k ( or the qca9887 firmware ) is
>> utilizing 15 - 20mb of memory. I applied the kfree(caldata) patch, to
>> insure there is no memory leak.
>>
>> It doesn't appear to be leaking, and it will run Ok with the high
>> memory footprint. However the Mikrotik hAP AC Lite is only a 64mb
>> platform; so when I initialize the 2nd radio with ath9k I get OOMs.
>>
>> It just doesn't seem right that when ath10k + qca9887 is in AP mode
>> that it's utilizing as much memory as it is. I don't think the issue
>> is with ath10k, I think it's the qca9887 firmware (
>> firmware-5.bin_10.2.4-1.0-00013 ).
>>
>> Is there a newer build available that may potentially fix these memory
>> issues? The latest one available on
>> https://github.com/kvalo/ath10k-firmware/blob/master/QCA9887/hw1.0/firmw=
are-5.bin_10.2.4-1.0-00013
>> is 2 months old. Perhaps there is a newer build to test that may have
>> the fix?
>>
>> Any thoughts as to what it could be? I can provide more information if n=
eeded.
> 64MB of RAM nowadays is not much and ath10k is not really tested in such
> setups AFAIK. I guess you could try if reducing TARGET_10X_NUM_MSDU_DESC
> helps with the memory consumption, but no idea if that would even work
> without further modifications to ath10k.
>
> Also if you have fq-codel&co enabled that might increase memory
> consumption. Adding linux-wireless as people there might have better
the high memory consumption is a very common old problem. and no, 64 mb =

might not by much. but consider that qca9880 cards for instance are only =

used on embedded devices.
there is not even a windows driver available for it. its mainly used in =

routers and 64 mb ram is not uncommon here.
the problem with qca9887 sounds similar here. and the best. it only =

occures on ath10k. with the closed source qca driver it will work on =

embedded platforms. since
it was mentioned that this problem is caused by the firmware itself. so =

there wont be a solution until qca is finally getting in touch with this =

problem
> ideas.
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
