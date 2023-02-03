Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CCBC61DA4
	for <ath10k@archiver.kernel.org>; Fri,  3 Feb 2023 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj9QSEdlP/2xoIrmjNh2XcrGNXFcFgpojZ4WRcFT0K0=; b=Qn+IfgqCcFSj+j
	3TyMWRFyU/3earOdBoi8wVDxhgE14DCszPGa3BV86yFbuTvQYhVgOT6g9PwRBahfygfFqOWgrwupv
	hNBto7MBwmiEIWGJnSgwusevIGAFy/kB+gflmecet/+fLU2tvyUwnCMaHnF5pdXhmJMnmbsRTHBym
	p/IuV6p5PiBWh2SQDNBfl7bbCUE9lZ4dobx+9J1sWPScr5SPo3EH6CRbI2TCDWjQy32V+wIGa5y8s
	FT/BzP/cbWXf+UAd4Dhz4l74T6x/vhq9felhsJ+G+DTN7UcPs2WH3aXukNVEO78+Q5Ui9futPiVZ4
	cEH7Vno/CbFC/il/ABEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO13y-003JBe-FC; Fri, 03 Feb 2023 18:45:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO13v-003J9l-3R
	for ath10k@lists.infradead.org; Fri, 03 Feb 2023 18:45:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6617861FC9
	for <ath10k@lists.infradead.org>; Fri,  3 Feb 2023 18:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEEDC433EF
	for <ath10k@lists.infradead.org>; Fri,  3 Feb 2023 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675449925;
	bh=p1X6ugmSgzmfWKkwB9BSvV33mOB8R7h4or5Aj+xg7bc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebfuPC0zAOIWh3D49j9KohnB21VPXiY1L3ZzPbzjX3HtAC3/jmTixaUTvCK5LlE/w
	 IFv5eA7NMvzdpYw/XWRA1TNAa9JfhACQOFYPMyWJl7ibTW2coQMNQquLChIf8pqoRp
	 WqaZ4tTbCYQo3dkqEwXm7SEWtuhjvIUF5YPWRs4DBPtYVSrDfUl0JjVt3r5j1ZNLm0
	 JvexY1gwJF9PS7gLgeEno/KNnri9P0oaHEuPyR+aPZ8IePXXSfRGmscuGIpcHBCGsQ
	 PaLU28qfccw01YIYddw5tUMVOS4zR2mbYcokJ3/u/9yHp45doPjCi7VUwyc8f0ABlL
	 61/QRB9V1pMOQ==
Received: by mail-vk1-f182.google.com with SMTP id l129so3029450vkh.6
        for <ath10k@lists.infradead.org>; Fri, 03 Feb 2023 10:45:25 -0800 (PST)
X-Gm-Message-State: AO0yUKVwqW+BI8ckFJNQ6BgR46DhQ1YsIKMpaCD1rvRLG9VDDPd9YBw4
	E0gikX/OgaJtsOQRsiQBCZyR2dx3LliKZuIfIA==
X-Google-Smtp-Source: AK7set8aljTXKYnSleLN5uKaZefTJzwSLTnGjjUc4dff/Ia7so1d0a9zhKmWJNIhVMP8fr42WVgEKFBt3+beg59W0e8=
X-Received: by 2002:ac5:cbf8:0:b0:3d5:d30f:81c2 with SMTP id
 i24-20020ac5cbf8000000b003d5d30f81c2mr1617935vkn.14.1675449924803; Fri, 03
 Feb 2023 10:45:24 -0800 (PST)
MIME-Version: 1.0
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
 <20230203104822.361415-1-equu@openmail.cc> <20230203104822.361415-4-equu@openmail.cc>
 <CAL_JsqKq1Yv+svKMS3R=TmDui1VJEjinoPFoDAAgr8tBbV1aSQ@mail.gmail.com> <aef1d48b-cfc2-1a5d-d26c-deae85875d43@openmail.cc>
In-Reply-To: <aef1d48b-cfc2-1a5d-d26c-deae85875d43@openmail.cc>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Feb 2023 12:45:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbGBQcxDQSbsqFyE2CR3VH=61NtZvU2YqE1visdUZXCQ@mail.gmail.com>
Message-ID: <CAL_JsqLbGBQcxDQSbsqFyE2CR3VH=61NtZvU2YqE1visdUZXCQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] wifi: ath10k: only load compatible DT cal data
To: equu@openmail.cc
Cc: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org, 
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_104527_219157_A372E3E7 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, Feb 3, 2023 at 11:15 AM <equu@openmail.cc> wrote:
>
> > I think this can be done a bit cleaner and like other drivers. I see 2 options.
> > The first way is use VID/PID compatible strings and don't set the
> > of_node pointer if there is a mismatch.
> Where should I do this? In pci_set_of_node() from drivers/pci/of.c?

Off the top of my head, I think so.

> > Upon further thought, why can't you decide all this just on PCI
> > VID/PID? The giant switch statement in ath10k_pci_probe() could all
> > just be struct of driver_data from the PCI match table.
>
> I cannot decide all this just on PCI VID/PID because PCI VID/PID cannot tell whether calibration data are stored in the device (like most expansion cards) or not (for example, in an NVRAM cell referenced by the device tree).
>

For a given VID/PID, you could have calibration data in DT that you
want to ignore sometimes and not other times (because the compatible
is wrong)?

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
