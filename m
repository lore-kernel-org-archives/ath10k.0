Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36112C25B74
	for <ath10k@archiver.kernel.org>; Mon, 27 May 2024 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTx0DmznR+fHb3CgpCX7dbFpZavxJ/1yi719Sv0t4Ms=; b=0H/Y0bw5kSJ5cc4PObtEwz+O/k
	5O2plnXeRjKy/pm5Im18XnbL5NcyvrzH8WdG2vB2EVe/6CftHNHza5kEN3F/NP6d+ihYz3Vnj8gAE
	ZI82W1xxwAt+5RAohzosWOECCbAEdD3n7xfQWGto5xYQfT99LIYdYJJEQ7kOd36M8R4bJowfpwF3N
	FpScG3J4D5esDzeGlnjLGkY5xTqjO8ef2sxrZ38UmJeVBxyUpUc2GyIq2yS49EKDZoMTwrpBUGrOj
	0Y/OT2JWitMVrMZLZeDBOUy1TbX0RxMfJ266RTQES28ItRKLy8QeF038DTN4z7KaFifSrgVfIyMsJ
	/By/a6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBacE-0000000F9qX-0KdX;
	Mon, 27 May 2024 13:42:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBacB-0000000F9pH-2KmD
	for ath10k@lists.infradead.org;
	Mon, 27 May 2024 13:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E116461143;
	Mon, 27 May 2024 13:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4212C2BBFC;
	Mon, 27 May 2024 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716817334;
	bh=cHdLFNG7QdO/v0uCoRD5sykZrNWbsVKGxrYwZl/Gm2I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vEDZjgd8DAMhfS2OaiAJd2CijDT/iN7Xx2TV20FxpdqzX21MTy1203CgyyhSYahHG
	 dBP6g+ga7MWEZP3QQeGa3TcBOXDAEyY/iHcvZiaFMkNXdg8vwbZhQmlPxjTyOTNs1C
	 X+gtNeajxlStK0bLkZay7GELUUAiSde2vHdJFDlNb4tu6N032q79seFK/7k3xJBj+3
	 cZEfHKff/1dx87vhGkW3ug5WJ5H7zqrH3eRXkTP0VUhgtnagtUcbOjSZJep8vgTesL
	 snV1uXiwUYSIiacJWWElX53EUpQiEniY4pFHJj7V/XsvFKZ/iWv4z1xIltRlhGn3y9
	 w4evBhrDdhNWw==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Hans de Goede <hdegoede@redhat.com>,
  James Prestwood <prestwoj@gmail.com>
Subject: Re: ath10k_pci 0000:3a:00.0: Could not init core: -110
References: <0c544b16-5c0d-4687-9f96-8ff1f3269f79@molgen.mpg.de>
	<e1bc0bb8-a66e-4e03-bc22-3dc506b6fb59@quicinc.com>
	<87sey38vte.fsf@kernel.org>
	<96828117-2cf8-4a34-a8e6-78ace96b32d3@molgen.mpg.de>
Date: Mon, 27 May 2024 16:42:10 +0300
In-Reply-To: <96828117-2cf8-4a34-a8e6-78ace96b32d3@molgen.mpg.de> (Paul
	Menzel's message of "Mon, 27 May 2024 12:24:59 +0200")
Message-ID: <87o78r8j7x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_064215_704143_11E82DEC 
X-CRM114-Status: GOOD (  15.86  )
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

Paul Menzel <pmenzel@molgen.mpg.de> writes:

> Dear Kalle, dear Baochen,
>
>
> Am 27.05.24 um 11:10 schrieb Kalle Valo:
>> Baochen Qiang writes:
>>=20
>>> On 5/27/2024 4:42 PM, Paul Menzel wrote:
>
>>>> On the Intel Kaby Lake notebook Dell XPS 13 with
>>>>
>>>>  =C2=A0=C2=A0=C2=A0 3a:00.0 Network controller [0280]: Qualcomm Athero=
s QCA6174
>>>> 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
>>>>
>>>> with at least a self-built Linux 6.9-rc5, on April 26th, 2024, and
>>>> Linux 6.8.11, today, May 27th, 2024, the error below happened, and
>>>> the device couldn=E2=80=99t authenticate to a WiFi network until reloa=
ding
>>>> the module *ath10k_core* and *ath10k_pci* (didn=E2=80=99t check just
>>>> *ath10k_pci*):
>>>>
>>>>  =C2=A0=C2=A0=C2=A0 $ sudo modprobe -r ath10k_pci
>>>>  =C2=A0=C2=A0=C2=A0 $ sudo modprobe -r ath10k_core
>>>>  =C2=A0=C2=A0=C2=A0 $ sudo modprobe ath10k_pci
>>>>
>>>> ```
>>>> [=C2=A0=C2=A0 49.441618] ath10k_pci 0000:3a:00.0: wmi service ready ev=
ent not received
>>>> [=C2=A0=C2=A0 49.523814] ath10k_pci 0000:3a:00.0: Could not init core:=
 -110
>> [...]
>>=20
>>> Are you using a distro kernel?
>
> The 6.8.11 is Debian=E2=80=99s current Linux kernel in the suite *unstabl=
e/sid*
> (*linux-image-6.8.11-amd64* 6.8.11-1).
>
>>> Could you check if below patch merged in your kernel? if not can
>>> you merge it and try again?
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/net/wireless/ath/ath10k?id=3De57b7d62a1b2f496caf0beba81cec3c90fa=
d80d5
>> Paul, if you are feeling brave to try out an -rc this commit is in
>> just
>> released v6.10-rc1.
>
> Thank you. I haven=E2=80=99t found out yet, how to reproduce this. I=E2=
=80=99ll keep
> an eye on it.
>
> As the commit message says:
>
>> This results in timeout issue if the interrupt is not fired, due to
>> some unknown reasons.
>
> There are reports from 2016 to 2021 with similar symptoms. These were
> supposedly fixed with
> `/usr/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin` [1][2]:
>
>     $ md5sum /usr/lib/firmware/ath10k/QCA6174/hw3.0/board.bin
>     /usr/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin
>     cb37c63d9ca28f53fea1ff09ad7c7a82
>     /usr/lib/firmware/ath10k/QCA6174/hw3.0/board.bin
>     651e921b372848b3928621e6f1d34b01
>     /usr/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin

Most likely that's a different issue from yours, just with same symptoms
(firmware crashing during firmware initialisation). I have seen also
cases when the firmware crashes when using a wrong board file, but I
suspect your board file is correct.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

