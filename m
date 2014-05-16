Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlIsl-00064T-4Y
 for ath10k@lists.infradead.org; Fri, 16 May 2014 14:13:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : RE : RE : RE : ath10k: set channel by command "iw" not from
 hostapd and DFS support of firmware-2.bin_10.1.467.2-1
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
 <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>
 <CALhHN=q_kuaszuBdsWHLZJYEA1PW63AqDFiF89DC3c4pOJseOg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D3@srvexch01.SODIELEC.local>
 <CALhHN=pYKwhCRy8RZWFm=5mssrL=oqTsazWfkVaN2L8O6YNO3w@mail.gmail.com>
 <87oayx6fp7.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=reP0gh+xbcRKc4gj4Edhs7V4Y5Eef=BLK3YP43v2p7Mw@mail.gmail.com>
Date: Fri, 16 May 2014 17:12:40 +0300
In-Reply-To: <CALhHN=reP0gh+xbcRKc4gj4Edhs7V4Y5Eef=BLK3YP43v2p7Mw@mail.gmail.com>
 (Janusz Dziedzic's message of "Fri, 16 May 2014 16:03:53 +0200")
Message-ID: <877g5l4xt3.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 16 May 2014 15:00, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>>
>>> Seems CONFIG_ATH10K_DFS_CERTIFIED is not set.
>>> You can simply check this during compilation adding eg. to mac.c
>>> #ifndef CONFIG_ATH10K_DFS_CERTIFIED
>>> #error DFS_NOT_SET
>>> #endif
>>
>> This reminds me of a feature I have been thinking. We really should have
>> an info print of what ath10k kconfig options are enabled in the build.
>> For example something like this:
>>
>> ath10k: debug off debugfs on tracing off dfs on
>>
>> Patches welcome :)
>
> I can add this, but question here is what *.c file should I use -
> mac.c looks fine

I think having it after the info message below in core.c is a good place.

	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
		ath10k_info("%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",

> but still someone can set flags only for some files and for some files
> not.

We cannot make this 100% bullet proof. If someone messes around with the
build system and breaks it in the process, then it his/her problem and
there's nothing we can do. We can only assume that the build system
works as specified.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
