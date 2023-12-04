Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD141C4167B
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Y+zGENVcnzhoscliHU+zgNY/Kp3swiQEJXLblhwy8A=; b=fpKv6UJ6Eq+Y6Wp9KY5dFw8+Lc
	WYc33ED5hdUPRXlEM6QH/PQc0nJjuKBGJmTqZD1MNN6OZx1MMu4P3P+R15sU40/GdCDYgR1CgtPhb
	ADn5F+xcUakNkMowzd0dW6FqAA92G+6ecD54C/jaTmgJR+hLIFDnyiMBGLj1zHJMNWpaAIii2JOJG
	ppf9HkNFLGg1qkrE5eSlNaGx7F9HOSvsSg2jdqSbbb035ehoQ8kJ9mne0N3FMzoATL6LYYg1N945B
	dFGwGUdaacobVjVL3D0WwFow+bcw7g3tdN3vVjiiop11FQxOFpfo7ElvrTLzyKTHPpMmqkcHq2GzU
	aPrGyc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7sE-003ssz-2r;
	Mon, 04 Dec 2023 12:16:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7sC-003spq-1K
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 12:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD10561025;
	Mon,  4 Dec 2023 12:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F13C433C7;
	Mon,  4 Dec 2023 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701692187;
	bh=fc/FTHJIR3OE8ibUODqU3UGV2wgertJeCOgaje1qPgA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DcEDU0RATDwbEkEUo5QMJpTaaSeruSNmxpEF/b6F0PSPJItD4Hii6Gpn0HPB6DttL
	 wgZeIvv3RFoMJ5SUjEZFQgLOxEnCsWG8tJTARCMJicm+K7xzSLXhstdd7nnaSMQ6Nf
	 JcZMPAwPtCKMIHZkhxVrjsg8j2xG9USuYhsJGoyvd7NJbVYoekk7nMPBPgPqs1UGA+
	 2yhOVxJ2LkUdGdrUS1CIfa084PImSYHs3h7rSKSerW0wWm4yP8yINoZ9IbgFksO0PO
	 iPDggsbClUzBLp+1BWC9Gv3uIMqHfOHsswbsh8PP3yGm/tYGWC9/Rne2req1pk74Y3
	 xfG+h8lZWrsOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] wifi: ath10k: Default to board.bin for legacy board
 data file
References: <20230825202610.1580132-1-dmitry.baryshkov@linaro.org>
	<87pm3afjda.fsf@kernel.org>
	<CAA8EJprZvCtCKoV4J=21=2+fDM1gTfJBOThj13J3sE0w5AqpPw@mail.gmail.com>
Date: Mon, 04 Dec 2023 14:16:24 +0200
In-Reply-To: <CAA8EJprZvCtCKoV4J=21=2+fDM1gTfJBOThj13J3sE0w5AqpPw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Sat, 26 Aug 2023 16:56:43 +0300")
Message-ID: <87plzmqi1z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_041628_494036_89A1ED81 
X-CRM114-Status: GOOD (  18.72  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Sat, 26 Aug 2023 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > Default to 'board.bin' for the legacy board data file, in case the
>> > hw_params array doesn't list hw-specific board data file name (e.g. for
>> > WCN3990).
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Could you provide more background _why_ this is needed. What are you
>> trying to fix?
>
> Sure. For wcn3990 we do not have the
> `ath10k_hw_params_list[].fw.board' set. So if the board data is not
> present in `board-2.bin', the driver will skip looking into
> `board.bin' and will error out.
>
> I had two options: either to set the `.fw.board' in
> `ath10k_hw_params_list', or to provide this default. Granted that the
> check for `fw.board' also prevents the `board-%s-%s.bin' lookup, I
> opted for the second option.

Ah, now I understand.

> Maybe I should just set the .fw.board to "board.bin" and
> .fw.board_size to 26328 (?)

Yeah, I think that would be much better to set those fields for WCN3990.
Please also include to the commit message the description you wrote
above.

I can't remember anymore why even have this struct
ath10k_hw_params_fw::board field in the first, most likely due to some
legacy reasons before we had board-2.bin. I suspect all the fields even
contain the same "board.bin" string so in theory the field is not really
needed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

