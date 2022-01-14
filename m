Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928B3C433EF
	for <ath10k@archiver.kernel.org>; Fri, 14 Jan 2022 06:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haixTn+1vIF1znEiz4d595DZnXeVIoyW2kwROTMxwLY=; b=FGiE85XGiMvEi4
	pgPdifhcx9KiFreQKvbdXo3oBqE4uoB8Taw6Xfwl0ab/MNHBVsCd2BfuNkcsdLp7ZoSKWeKK1nwZn
	PqQxf0fVLHcTa7wB8nZmZDOJc93Z5zOvq+OFYK409wZ+dhFrjfdZLiwA5fUqPG4SxoSRdqDxuPvtp
	XIy4Kbbdm0vwGQUqV3en5I8ucIQfnsinH5h6Z7Y9JI/UqHJS3IXebKhwm2uHEoU3n3Y8HfFVt9xPD
	sSfcTZ1CsNAILtqT64IRMjjN8Fwc7mBeizHfdYJK7htThlzMIfeXhdBX+T0xRq5uT4MMEoVWRwmhy
	KvVbi9htmlIu3Oj39/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8GNH-007xUO-KQ; Fri, 14 Jan 2022 06:47:47 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8GNE-007xT8-2M
 for ath10k@lists.infradead.org; Fri, 14 Jan 2022 06:47:45 +0000
Received: by mail-il1-x130.google.com with SMTP id a2so1742378ilr.0
 for <ath10k@lists.infradead.org>; Thu, 13 Jan 2022 22:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=coIPDcnV+HnWEv56bf027+mB1pYRbPlLmW3kBkxW2fM=;
 b=WTDBSACAqrj6H5Q3fjs7kqd/ZTCyi11zUQICyqiSTy9EfTsV3bTQBKiA04wgyQsD5/
 zHwbNCCHXGHK1dHJugJOsIpD6Z2gAV+8aPEQO32v9jd3dY3ITbezrmE1UQn0sIYkoXW3
 5S44cluqV1GBW41hfEEZaxFjOYPwfaDVTlH3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coIPDcnV+HnWEv56bf027+mB1pYRbPlLmW3kBkxW2fM=;
 b=Djq4le9VghqcnlxE/GJMhT8n01XTn0EVtGXPKrAoaoWopaBePDX4AuNaSy1qFcHcn6
 MAspY3bZSKQrjj/gBzDO7mPHM8JImu7p65rg9rdyOZgN8ODK/5ZlGYVbSWJYhcmsD7Dm
 R2HZo3dlO+b2sQ55CW2zz+UPbVGopJGAddDbZmNUuNurdiwS8mCEM8xmxF3jeuewbxvA
 gYzluazU4kYaCTe99GJ0woP4UQ/oCT6a+vL6fd9QSr/M/I6ed1kG51rFwd4O9OMy7bly
 yUYIrXiivU8QtFUY/iKf7DpYVG+TojD8Jc2i5RjhEqjJSD6iUkUS5Uz5fWUTMAtAHuml
 2O/A==
X-Gm-Message-State: AOAM5311rSU7aJzGJjN1rUeR+HkmniZwgDkO3RCXXA03CHyM92f0qyWn
 gXsrKeBO5ZGatiSReEklLYf+m8NIK5nP4dFp8VyCng==
X-Google-Smtp-Source: ABdhPJyiXF3NuvXrV68vVsq5L3Bld5EeEj25jQd9Mtca7hCVahuYe+O27eWAcP8UIkj/Bd9C7mmPGoXxfQSoA3vkI3Y=
X-Received: by 2002:a05:6e02:1786:: with SMTP id
 y6mr4099914ilu.99.1642142862486; 
 Thu, 13 Jan 2022 22:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <202201110851.5qAxfQJj-lkp@intel.com>
In-Reply-To: <202201110851.5qAxfQJj-lkp@intel.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Thu, 13 Jan 2022 22:47:31 -0800
Message-ID: <CACTWRwtCjXbpxkixAyRrmK5gRjWW7fMv5==9j=YcsdN-mnYhJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
To: kernel test robot <lkp@intel.com>
Cc: kvalo@codeaurora.org, ath10k@lists.infradead.org, kbuild-all@lists.01.org, 
 pillair@codeaurora.org, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dianders@chromium.org, 
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_224744_155471_4CCE8D6C 
X-CRM114-Status: GOOD (  17.79  )
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

Hi Reviewers,

On this patch I have a kernel bot warning, which I intend to fix along
with all the comments and discussion and push out V3. So, any
comments/next steps are appreciated.

Thanks
Abhishek

On Mon, Jan 10, 2022 at 5:08 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Abhishek,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on kvalo-ath/ath-next]
> [also build test WARNING on kvalo-wireless-drivers-next/master kvalo-wireless-drivers/master v5.16 next-20220110]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Abhishek-Kumar/ath10k-search-for-default-BDF-name-provided-in-DT/20220111-071636
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220111/202201110851.5qAxfQJj-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/50c4c7cb02cc786afcd9aff27616a6e20296c703
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Abhishek-Kumar/ath10k-search-for-default-BDF-name-provided-in-DT/20220111-071636
>         git checkout 50c4c7cb02cc786afcd9aff27616a6e20296c703
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/net/wireless/ath/ath10k/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_parse_default_bdf_dt':
> >> drivers/net/wireless/ath/ath10k/core.c:1103:116: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
>     1103 |                             "default board name is longer than allocated buffer, board_name: %s; allocated size: %ld\n",
>          |                                                                                                                  ~~^
>          |                                                                                                                    |
>          |                                                                                                                    long int
>          |                                                                                                                  %d
>     1104 |                             board_name, sizeof(ar->id.default_bdf));
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                         |
>          |                                         unsigned int
>
>
> vim +1103 drivers/net/wireless/ath/ath10k/core.c
>
>   1083
>   1084  int ath10k_core_parse_default_bdf_dt(struct ath10k *ar)
>   1085  {
>   1086          struct device_node *node;
>   1087          const char *board_name = NULL;
>   1088
>   1089          ar->id.default_bdf[0] = '\0';
>   1090
>   1091          node = ar->dev->of_node;
>   1092          if (!node)
>   1093                  return -ENOENT;
>   1094
>   1095          of_property_read_string(node, "qcom,ath10k-default-bdf",
>   1096                                  &board_name);
>   1097          if (!board_name)
>   1098                  return -ENODATA;
>   1099
>   1100          if (strscpy(ar->id.default_bdf,
>   1101                      board_name, sizeof(ar->id.default_bdf)) < 0)
>   1102                  ath10k_warn(ar,
> > 1103                              "default board name is longer than allocated buffer, board_name: %s; allocated size: %ld\n",
>   1104                              board_name, sizeof(ar->id.default_bdf));
>   1105
>   1106          return 0;
>   1107  }
>   1108  EXPORT_SYMBOL(ath10k_core_parse_default_bdf_dt);
>   1109
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
