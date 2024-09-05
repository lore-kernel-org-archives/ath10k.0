Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2B2CD5BC5
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVkTAppLsFFf+Ks9HliuThhoTqnhlpTNP2mfkOmmILY=; b=lLlz4Dy7ZgSHoZqyi7QX4B9dei
	RH1MECv21ekAJZFRI8FZOr5cyldrdYgkFX0Q6xuDCW0pVT/rB9e0cWsptWETQrmQi/Y5mL4pJVt0C
	+doUD7XLCxkHv7tE9726kZg2WxKfq1rUwhQ0qRBlUGs/9jB4R5zgktK/bHjRiI753LX8+Sbp33f+Z
	nJm5SYep2NqZg2RY75OHtFXAH+N7gJ6BPPVRMJpIWo76LlKp9hInPuGls4CZAXIyG0e2+6neCdoVq
	CCZfrOpvNoUK1sdaSvdbuS8H+wEldglhwhLLJhGCZ9zVo02bTS2hw0AHl0JH5VIW2I2U0FjlSZKAb
	kLjP3h+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCSz-00000008WJ3-41ku;
	Thu, 05 Sep 2024 13:24:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCSG-00000008W5t-2ALM
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 13:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4B145C3FC3;
	Thu,  5 Sep 2024 13:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE12FC4CEC3;
	Thu,  5 Sep 2024 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725542599;
	bh=h+XbA3+VCIeuLn9lhEd8QO33LVVy/IJRQcMcL8Ekg3g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FJNk0sKRWaKGiQHD2tLO2bJzbExykEVZTAnVu7Y7XOAyMw+ZkkBcdgilkwrHJ6yUk
	 qbY8qZr6GdqhG9O0VfJ5Q8wGmY9W3TRAJoyjsM3uIqfV0pD24pjpw3k71A5CttjCXj
	 Ol0XM/C3aR4oaDOC9x0RBQAfttl5vxKNXXcaAZElf1AWChmaJEUENSq6S+pKuhiZOH
	 m/B2m/dg3qd+wlfVAnANk4ayhl4pZwir/BeqxNHuQc6W/XNPi4IvwFAUYFoyYFfnGv
	 NLepWwPO6y4eZXTCPpuKoPpEiK01WFrIpPH5sovgzEqIBceh3SU+1FhtDZPUrSvET8
	 8/rjbdW8dUYPA==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  James Prestwood
 <prestwoj@gmail.com>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>
Subject: Re: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware
 (-110) (ETIMEDOUT)
References: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
	<87bk13jwzv.fsf@kernel.org>
	<00dfdaab-4d26-45f6-b69d-049ae489b2bd@molgen.mpg.de>
Date: Thu, 05 Sep 2024 16:23:15 +0300
In-Reply-To: <00dfdaab-4d26-45f6-b69d-049ae489b2bd@molgen.mpg.de> (Paul
	Menzel's message of "Wed, 4 Sep 2024 23:42:35 +0200")
Message-ID: <877cbqcjzw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_062320_635866_1FFDAF07 
X-CRM114-Status: GOOD (  12.51  )
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

> Am 04.09.24 um 16:48 schrieb Kalle Valo:
>> Paul Menzel writes:
>
>>> Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3
>>> (or unloading and loading the `ath10k_core`/`ath10k_pci` modules)
>>> having been connected to an AVM network:
>>>
>>>      wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware=
 (-110)
>>>
>>> Error code 110 is the value for ETIMEDOUT. I saw James patch [1], and
>>> applied it, and the error is still there (as expected).
>>>
>>> Can the warning be improved so the user know, which component is at fau=
lt?
>> The warning comes from mac80211 and it already contains your network
>> interface name (wlp58s0). What else would you want to see?
>
> As an ignorant user, I do not know what to do with the warning. I=E2=80=
=99d
> like to see a suggestion how to get rid of the warning. Maybe:
>
>     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware
>     in X s (-110), please report it to the vendor firmware

The warning can come due to different reasons in different drivers, it's
not really easy to identify what the user should do.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

